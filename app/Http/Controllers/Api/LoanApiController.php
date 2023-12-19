<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Api\BaseController;
use App\Models\LoanModel;
use App\Models\LoanTopupModel;
use App\Models\TenantsModel;
use App\Models\TransactionsModel;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Ramsey\Uuid\Uuid;

class LoanApiController extends BaseController
{
    public function findLoanByCustomerId(): JsonResponse
    {
        $user = Auth::user();

        $customerId = $user->customer_id;
        $tenant = TenantsModel::where('id', $user->tenant_id)->first();
        $dsn = $tenant->core_database_dsn;

        $data = $this->sqlServerConnection($dsn)->table('crdmaster')
            ->select("crdmaster.norekcrd", "crdmaster.cif", "crdmaster.bakidebet", "crd_setup.kodeprodukcrd", "crd_setup.namafull")
            ->where("cif", $customerId)
            ->where("stsrekcrd", 1)
            ->join("crd_setup", "crd_setup.kodeprodukcrd", "=", "crdmaster.kodeprodukcrd")
            ->get();

        // if (!$data) {
        //     return $this->sendResponse('Failed', "Failed");
        // }

        $transformedData = $data->map(function ($item) {
            return [
                'id' => $item->norekcrd,
                'customerId' => $item->cif,
                'outstandingBalance' => $item->bakidebet,
                'productType' => [
                    'id' => $item->kodeprodukcrd,
                    'name' => $item->namafull
                ]
            ];
        });

        return $this->sendResponse($transformedData, 'Loan successfully');
    }

    public function findLoanById(String $id): JsonResponse
    {
        $user = Auth::user();

        $customerId = $user->customer_id;
        $tenant = TenantsModel::where('id', $user->tenant_id)->first();
        $dsn = $tenant->core_database_dsn;

        $data = $this->sqlServerConnection($dsn)->table('crdmaster')
            ->select("crdmaster.norekcrd", "crdmaster.cif", "crdmaster.bakidebet", "crd_setup.kodeprodukcrd", "crd_setup.namafull")
            ->where("cif", $customerId)
            ->where("norekcrd", $id)
            ->join("crd_setup", "crd_setup.kodeprodukcrd", "=", "crdmaster.kodeprodukcrd")
            ->first();

        $transformedData =  [
            'id' => $data->norekcrd,
            'customerId' => $data->cif,
            'outstandingBalance' => $data->bakidebet,
            'productType' => [
                'id' => $data->kodeprodukcrd,
                'name' => $data->namafull
            ]
        ];

        return $this->sendResponse($transformedData, 'Loan successfully');
    }

    public function findLoanRepaymentScheduleByLoanID(String $id): JsonResponse
    {
        $user = Auth::user();

        $tenant = TenantsModel::where('id', $user->tenant_id)->first();
        $dsn = $tenant->core_database_dsn;
        $cdTrxArray = [410, 411, 412, 420, 421, 422];

        $data = $this->sqlServerConnection($dsn)->table('history_crd')
            ->where("noacc", $id)
            ->whereIn('cd_trx1', $cdTrxArray)
            ->orderBy('create_date')
            ->get();

        $transformedData = $data->map(function ($item) {
            return [
                'type' => $item->tipe,
                'amount' => $item->nominal,
                'description' => $item->keterangan,
                'loanID' => $item->noacc,
                'repaymentDate' => $item->tgltrx
            ];
        });

        $originalArray = json_decode($transformedData, true);
        $reversedArray = array_reverse($originalArray);

        return $this->sendResponse($reversedArray, 'Loan successfully');
    }

    public function findLoanRepaymentScheduleUpcoming(String $id): JsonResponse
    {
        $user = Auth::user();

        $customerId = $user->customer_id;
        $tenant = TenantsModel::where('id', $user->tenant_id)->first();
        $dsn = $tenant->core_database_dsn;

        $data = $this->sqlServerConnection($dsn)->table('rps')
            ->select("norekcrd", "totalangsuran", "periode", "tagpokok", "tagbunga", "tagdenda", "byrpokok", "byrbunga", "byrdenda", "tglangsuran", "tglbyr")
            ->where("cif", $customerId)
            ->where("norekcrd", $id)
            ->where(function ($query) {
                $query->orWhereRaw('tagbunga > byrbunga')
                    ->orWhereRaw('tagpokok > byrpokok');
            })
            ->get();

            $transformedData = $data->map(function ($item) {
                $total = $item->tagpokok - $item->byrpokok + $item->tagbunga - $item->byrbunga + $item->tagdenda - $item->byrdenda;
                return [
                    $item->periode,
                    $item->tglangsuran,
                    $this->formatNumber($item->tagpokok - $item->byrpokok),
                    $this->formatNumber($item->tagbunga - $item->byrbunga),
                    $this->formatNumber($item->tagdenda - $item->byrdenda),
                    $this->formatNumber($total),
                ];
            })->filter()->values();

        $originalArray = json_decode($transformedData, true);

        return $this->sendResponse($originalArray, 'Loan successfully');
    }

    // public function findLoanRepaymentScheduleByLoanID(String $id): JsonResponse
    // {
    //     $user = Auth::user();

    //     $customerId = $user->customer_id;
    //     $tenant = TenantsModel::where('id', $user->tenant_id)->first();
    //     $dsn = $tenant->core_database_dsn;

    //     $data = $this->sqlServerConnection($dsn)->table('rps')
    //         ->select("norekcrd", "totalangsuran", "periode", "tagpokok", "tagbunga", "tagdenda", "byrpokok", "byrbunga", "byrdenda", "tglangsuran", "tglbyr")
    //         ->where("cif", $customerId)
    //         ->where("norekcrd", $id)
    //         // ->where(function ($query) {
    //         //     $query->where('byrpokok', '<', 'tagpokok')
    //         //         ->orWhere('byrbunga', '<', 'tagbunga')
    //         //         ->orWhere('byrdenda', '<', 'tagdenda');
    //         // })
    //         ->where('tglangsuran', '<=', function ($subquery) {
    //             $subquery->select('tanggal2')
    //                 ->from('reffsys')
    //                 ->where('kode1', 'TGL');
    //         })
    //         ->get();

    //     $transformedData = $data->map(function ($item) {
    //         return [
    //             'term' => $item->periode,
    //             'amount' => $item->totalangsuran,
    //             'loanID' => $item->norekcrd,
    //             'principalAmount' => $item->tagpokok,
    //             'interestAmount' => $item->tagbunga,
    //             'penaltyAmount' => $item->tagdenda,
    //             'repaymentDate' => date('d-m-Y', strtotime($item->tglbyr))
    //         ];
    //     });

    //     $originalArray = json_decode($transformedData, true);
    //     $reversedArray = array_reverse($originalArray);

    //     return $this->sendResponse($reversedArray, 'Loan successfully');
    // }

    // public function findLoanRepaymentScheduleUpcoming(String $id): JsonResponse
    // {
    //     $user = Auth::user();

    //     $customerId = $user->customer_id;
    //     $tenant = TenantsModel::where('id', $user->tenant_id)->first();
    //     $dsn = $tenant->core_database_dsn;

    //     $data = $this->sqlServerConnection($dsn)->table('rps')
    //         ->select("norekcrd", "totalangsuran", "periode", "tagpokok", "tagbunga", "tagdenda", "byrpokok", "byrbunga", "byrdenda", "tglangsuran", "tglbyr")
    //         ->where("cif", $customerId)
    //         ->where("norekcrd", $id)
    //         ->get();

    //     $transformedData = $data->map(function ($item) {
    //         if (2000 > intval(date("Y", strtotime($item->tglbyr)))) {
    //             return [
    //                 'term' => $item->periode,
    //                 'amount' => $this->formatNumber($item->totalangsuran),
    //                 'loanID' => $item->norekcrd,
    //                 'principalAmount' => $this->formatNumber($item->tagpokok),
    //                 'interestAmount' => $this->formatNumber($item->tagbunga),
    //                 'penaltyAmount' => $this->formatNumber($item->tagdenda),
    //                 'repaymentDate' => "-"
    //             ];
    //         }
    //     })->filter()->values();

    //     $originalArray = json_decode($transformedData, true);

    //     return $this->sendResponse($originalArray, 'Loan successfully');
    // }

    public function findLoanProductType(): JsonResponse
    {
        $user = Auth::user();

        $tenant = TenantsModel::where('id', $user->tenant_id)->first();
        $dsn = $tenant->core_database_dsn;

        $data = $this->sqlServerConnection($dsn)->table("crd_setup")
            ->where('kodeprodukcrd', 01)
            ->select('kodeprodukcrd', 'namafull')
            ->get();

        $modifiedData = [];
        foreach ($data as $item) {
            $modifiedData[] = [
                'value' => $item->kodeprodukcrd,
                'label' => $item->namafull,
            ];
        }

        return $this->sendResponse($modifiedData, 'Saving successfully');
    }

    public function createLoan(Request $request): JsonResponse
    {
        $user = Auth::user();

        $loan = new LoanModel();

        $loan->id = $this->generateUniqueValueAsString();
        $loan->status = 0;
        $loan->customer_id = $user->customer_id;
        $loan->created_by = $user->id;
        $loan->updated_by = $user->id;
        $loan->tenant_id = $user->tenant_id;

        $loan->product_type = $request->productType;
        $loan->current_balance = $request->currentBalance;
        $loan->jangkawaktu = $request->period;

        $loan->save();

        $tenant = TenantsModel::where('id', $user->tenant_id)->first();
        $dsn = $tenant->core_database_dsn;

        $datas = $this->sqlServerConnection($dsn)->table("crd_setup")
            ->select('kodeprodukcrd', 'namafull')
            ->get();

        $selectedProduct = null;
        foreach ($datas as $data) {
            if ($data->kodeprodukcrd == $request->productType) {
                $selectedProduct = $data->namafull;
                break;
            }
        }

        if (!$selectedProduct) {
            return $this->sendError('Product type not found', [], 404);
        }

        $title = "Pengajuan Pinjaman anda sedang diproses";
        $description = json_encode([
            'Tipe Produk' => $selectedProduct,
            'Jumlah' => "Rp. " . number_format($request->currentBalance, 0, ',', '.'),
            'Jangka Waktu' => $request->period . " Bulan"
        ]);

        $parent = "03" . $loan->id;

        $this->sendNotification($title, $description, 0, $user->id, $user->id, $parent);

        return $this->sendResponse($loan, 'Succesfully created Loan');
    }

    public function transactionLoanPayment(Request $request): JsonResponse
    {
        $user = Auth::user();

        $data = new TransactionsModel();

        $uuid = Uuid::uuid4()->toString();

        $data->id = $uuid;
        $data->local_id = $uuid;
        $data->batch_id = 'mobile';
        $data->status = 0;
        $data->transaction_type = 3;
        $data->tenant_id = $user->tenant_id;
        $data->created_by = $user->id;
        $data->created_at = now();
        $data->branch_id = substr($request->loanId, 0, 3);

        $data->loan_id = $request->loanId;
        $data->amount = $request->amount;
        $data->payment_method_id = $request->paymentMethodId;
        $data->recipient = $request->recipient;

        $data->save();

        $title = "Bayar Tagihan anda sedang diproses";
        $description = json_encode([
            'No. Rekening' => $request->savingId,
            'Metode Pembayaran' => $this->getPaymentMethodName($request->paymentMethodId),
            'Nama Pengirim' => $request->recipient,
            'Jumlah' => "Rp. " . number_format($request->amount, 0, ',', '.')
        ]);

        $parent = "07" . $data->id;

        $this->sendNotification($title, $description, 0, $user->id, $user->id, $parent);

        return $this->sendResponse($data, 'Successfuly');
    }

    public function loanTopup(Request $request): JsonResponse
    {
        $user = Auth::user();

        $data = new LoanTopupModel();

        $data->id = $this->generateUniqueValueAsString();
        $data->created_by = $user->id;
        $data->created_at = now();
        $data->tenant_id = $user->tenant_id;
        $data->status = 0;

        $data->loan_id = $request->loanId;
        $data->amount = $request->amount;
        $data->reason = $request->reason;

        $data->save();

        $title = "Topup Pinjaman anda sedang diproses";
        $description = json_encode([
            'No. Rekening' => $request->loanId,
            'Alasan' => $request->reason,
            'Jumlah' => "Rp. " . number_format($request->amount, 0, ',', '.')
        ]);

        $parent = "05" . $data->id;

        $this->sendNotification($title, $description, 0, $user->id, $user->id, $parent);

        return $this->sendResponse($data, 'Berhasil mengajukan topup');
    }
}
