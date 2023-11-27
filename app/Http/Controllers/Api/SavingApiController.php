<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Api\BaseController;
use App\Models\SavingsModel;
use App\Models\TenantsModel;
use App\Models\TransactionsModel;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Ramsey\Uuid\Uuid;

class SavingApiController extends BaseController
{
    public function findSavingByCustomerId(): JsonResponse
    {
        $user = Auth::user();

        $customerId = $user->customer_id;
        $tenant = TenantsModel::where('id', $user->tenant_id)->first();
        $dsn = $tenant->core_database_dsn;

        $data = $this->sqlServerConnection($dsn)->table('tabmaster')
        ->select("tabmaster.norekening", "tabmaster.cif", "tabmaster.create_date", "tabmaster.saldoawal", "tabmaster.saldoakhir", "tabungan_setup.kodeproduk", "tabungan_setup.namafull")
        ->where('cif', $customerId)
        ->where('stsrektab', 1)
        ->join("tabungan_setup", "tabungan_setup.kodeproduk", "=", "tabmaster.kodeproduktab")
        ->get();

        $transformedData = $data->map(function ($item) {
            return [
                'id' => $item->norekening,
                'customerId' => $item->cif,
                'createdAt' => $item->create_date,
                'currentBalance' => $item->saldoawal,
                'availableBalance' => $item->saldoakhir,
                'productType' => [
                    'id' => $item->kodeproduk,
                    'name' => $item->namafull
                ]
            ];
        });

        return $this->sendResponse($transformedData, 'Saving successfully');
    }

    public function findSavingById(String $id): JsonResponse
    {
        $user = Auth::user();

        $customerId = $user->customer_id;
        $tenant = TenantsModel::where('id', $user->tenant_id)->first();
        $dsn = $tenant->core_database_dsn;

        $data = $this->sqlServerConnection($dsn)->table('tabmaster')
        ->select("tabmaster.norekening", "tabmaster.cif", "tabmaster.create_date", "tabmaster.saldoawal", "tabmaster.saldoakhir", "tabungan_setup.kodeproduk", "tabungan_setup.namafull")
        ->where('cif', $customerId)
        ->where("norekening", $id)
        ->join("tabungan_setup", "tabungan_setup.kodeproduk", "=", "tabmaster.kodeproduktab")
        ->first();

        $transformedData = [
            'id' => $data->norekening,
            'customerId' => $data->cif,
            'createdAt' => $data->create_date,
            'currentBalance' => $data->saldoawal,
            'availableBalance' => $data->saldoakhir,
            'productType' => [
                'id' => $data->kodeproduk,
                'name' => $data->namafull
            ]
        ];

        return $this->sendResponse($transformedData, 'Saving successfully');
    }

    public function findSavingTranactionBySavingId(String $id): JsonResponse
    {
        $user = Auth::user();

        $tenant = TenantsModel::where('id', $user->tenant_id)->first();
        $dsn = $tenant->core_database_dsn;
        
        $data = $this->sqlServerConnection($dsn)->table('history_tab')
        ->select('notrx', 'noacc', 'create_date', 'nominal', 'keterangan', 'tipe')
        ->where("noacc", $id)
        ->limit(10)
        ->get();

        $transformedData = $data->map(function ($item) {
            return [
                'id' => $item->notrx,
                'title' => $item->keterangan,
                'transactionType' => $item->tipe,
                'amount' => $item->nominal,
                'createdAt' => $item->create_date,
            ];
        });

        $originalArray = json_decode($transformedData, true);
        $reversedArray = array_reverse($originalArray);

        return $this->sendResponse($reversedArray, 'Saving successfully');
    }

    public function findSavingProductType(): JsonResponse
    {
        $user = Auth::user();

        $tenant = TenantsModel::where('id', $user->tenant_id)->first();
        $dsn = $tenant->core_database_dsn;

        $data = $this->sqlServerConnection($dsn)->table('tabungan_setup')
        ->where('kodeproduk', 02)
        ->select('kodeproduk', 'namafull')
        ->get();

        $modifiedData = [];
        foreach ($data as $item) {
            $modifiedData[] = [
                'value' => $item->kodeproduk,
                'label' => $item->namafull,
            ];
        }

        return $this->sendResponse($modifiedData, 'Saving successfully');
    }

    public function createSaving(Request $request): JsonResponse
    {
        $user = Auth::user();

        $saving = new SavingsModel();

        $saving->id = $this->generateUniqueValueAsString();
        $saving->status = 0;
        $saving->customer_id = $user->customer_id;
        $saving->created_by = $user->id;
        $saving->updated_by = $user->id;
        $saving->tenant_id = $user->tenant_id;

        $saving->product_type = $request->productType;
        $saving->current_balance = $request->currentBalance;

        $saving->save();

        $tenant = TenantsModel::where('id', $user->tenant_id)->first();
        $dsn = $tenant->core_database_dsn;

        $datas = $this->sqlServerConnection($dsn)->table('tabungan_setup')
        ->select('kodeproduk', 'namafull')
        ->get();

        $selectedProduct = null;
        foreach ($datas as $data) {
            if ($data->kodeproduk == $request->productType) {
                $selectedProduct = $data->namafull;
                break;
            }
        }

        if (!$selectedProduct) {
            return $this->sendError('Product type not found', [], 404);
        }

        $title = "Pengajuan Simpanan anda sedang diproses";
        $description = json_encode([
            'Tipe Produk' => $selectedProduct,
            'Jumlah' => "Rp. " . number_format($request->currentBalance, 0, ',', '.')
        ]);
        
        $parent = "02" . $saving->id;

        $this->sendNotification($title, $description, 0, $user->id, $user->id, $parent);

        return $this->sendResponse($saving, 'Succesfully created Saving');
    }

    public function transactionDepositSaving(Request $request): JsonResponse
    {
        $user = Auth::user();

        $data = new TransactionsModel();

        $uuid = Uuid::uuid4()->toString(); 
        
        $data->id = $uuid;
        $data->local_id = $uuid;
        $data->batch_id = "mobile";

        $data->status = 0;
        $data->transaction_type = 1;
        $data->tenant_id = $user->tenant_id;
        $data->created_by = $user->id;
        $data->created_at = now();
        $data->branch_id = substr($request->savingId, 0, 3);

        $data->saving_id = $request->savingId;
        $data->amount = $request->amount;
        $data->payment_method_id = $request->paymentMethodId;
        $data->recipient = $request->recipient;

        $data->save();

        $title = "Setoran Simpanan anda sedang diproses";
        $description = json_encode([
            'No. Rekening' => $request->savingId,
            'Metode Pembayaran' => $this->getPaymentMethodName($request->paymentMethodId),
            'Nama Pengirim' => $request->recipient,
            'Jumlah' => "Rp. " . number_format($request->amount, 0, ',', '.')
        ]);
        
        $parent = "06" . $data->id;

        $this->sendNotification($title, $description, 0, $user->id, $user->id, $parent);

        return $this->sendResponse($data, 'Successfuly');
    }
}
