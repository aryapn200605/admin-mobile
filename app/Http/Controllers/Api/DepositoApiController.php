<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Api\BaseController;
use App\Models\DepositsModel;
use App\Models\TenantsModel;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class DepositoApiController extends BaseController
{
    public function findDepositByCustomerId(): JsonResponse
    {
        $user = Auth::user();

        $customerId = $user->customer_id;
        $tenant = TenantsModel::where('id', $user->tenant_id)->first();
        $dsn = $tenant->core_database_dsn;

        $data = $this->sqlServerConnection($dsn)->table('deposito')
        ->select("deposito.norekdep", "deposito.cif", "deposito.tgljthtempo", "deposito.saldoawal", "deposito.saldoakhir", "deposito_setup.kodeproduk", "deposito_setup.namafull")
        ->where('cif', $customerId)
        ->where('stsrekdep', 1)
        ->join("deposito_setup", "deposito_setup.kodeproduk", "=", "deposito.kodeproduk")
        ->get();

        // if (!$data) {
        //     return $this->sendResponse('Failed', "Failed");
        // }

        $transformedData = $data->map(function ($item) {
            return [
                'id' => $item->norekdep,
                'customerId' => $item->cif,
                'createdAt' => $item->tgljthtempo,
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

    public function findDepositById(String $id): JsonResponse
    {
        $user = Auth::user();

        $customerId = $user->customer_id;
        $tenant = TenantsModel::where('id', $user->tenant_id)->first();
        $dsn = $tenant->core_database_dsn;

        $data = $this->sqlServerConnection($dsn)->table('deposito')
        ->select("deposito.norekdep", "deposito.cif", "deposito.tgljthtempo", "deposito.saldoawal", "deposito.saldoakhir", "deposito.jangkawaktu", "deposito_setup.kodeproduk", "deposito_setup.namafull")
        ->where('cif', $customerId)
        ->where('norekdep', $id)
        ->join("deposito_setup", "deposito_setup.kodeproduk", "=", "deposito.kodeproduk")
        ->first();

        $transformedData = [
            'id' => $data->norekdep,
            'customerId' => $data->cif,
            'createdAt' => $data->tgljthtempo,
            'currentBalance' => $data->saldoawal,
            'jangkawaktu' => $data->jangkawaktu,
            'availableBalance' => $data->saldoakhir,
            'productType' => [
                'id' => $data->kodeproduk,
                'name' => $data->namafull
            ]
        ];

        return $this->sendResponse($transformedData, 'Saving successfully');
    }

    public function findDepositProductType(): JsonResponse
    {
        $user = Auth::user();

        $tenant = TenantsModel::where('id', $user->tenant_id)->first();
        $dsn = $tenant->core_database_dsn;

        $data = $this->sqlServerConnection($dsn)->table('deposito_setup')
        ->select("kodeproduk", "namafull")
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

    public function createDeposit(Request $request): JsonResponse
    {
        $user = Auth::user();

        $deposit = new DepositsModel();

        $deposit->id = $this->generateUniqueValueAsString();
        $deposit->status = 0;
        $deposit->customer_id = $user->customer_id;
        $deposit->created_by = $user->id;
        $deposit->updated_by = $user->id;
        $deposit->tenant_id = $user->tenant_id;

        $deposit->product_type = $request->productType;
        $deposit->current_balance = $request->currentBalance;

        $deposit->save();
        
        $tenant = TenantsModel::where('id', $user->tenant_id)->first();
        $dsn = $tenant->core_database_dsn;
        
        $datas = $this->sqlServerConnection($dsn)->table('deposito_setup')
        ->select("kodeproduk", "namafull")
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

        $title = "Pengajuan Simpanan Berjangka anda sedang diproses";
        $description = json_encode([
            'Tipe Produk' => $selectedProduct,
            'Jumlah' => "Rp. " . number_format($request->currentBalance, 0, ',', '.'),
        ]);
        
        $parent = "04" . $deposit->id;

        $this->sendNotification($title, $description, 0, $user->id, $user->id, $parent);

        return $this->sendResponse($deposit, 'Succesfully created deposits');
    }
}
