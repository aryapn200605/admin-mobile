<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\API\BaseController as BaseController;
use App\Models\TenantsModel;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Auth;

class TenantApiController extends BaseController
{
    public function findAllTenants(): JsonResponse
    {
        $products = TenantsModel::all();

        return $this->sendResponse($products, 'Products retrieved successfully.');
    }

    public function findTenantById(String $id): JsonResponse
    {
        $data = TenantsModel::where('public_id', $id)->first();

        return $this->sendResponse($data, "success get all data");
    }


    /**
     * @param $type = 1 -> simpanan
     *                2 -> pinjaman
     * 
     * 
     */
    public function findPaymentMethod($type, String $id): JsonResponse
    {
        $user = Auth::user();

        $tenant = TenantsModel::where('id', $user->tenant_id)->first();
        $dsn = $tenant->core_database_dsn;

        if ($type == "1") {
            $sandicabang = $this->sqlServerConnection($dsn)->table('tabmaster')
                ->select('sandicabang')
                ->where('norekening', $id)
                ->first();
        } else if ($type == "2") {
            $sandicabang = $this->sqlServerConnection($dsn)->table('crdmaster')
                ->select('sandicabang')
                ->where('norekcrd', $id)
                ->first();
        }

        $datas = $this->sqlServerConnection($dsn)->table('aba')
            ->select('noaba', 'namabank', 'norek', 'namaaba')
            ->where('sandicabang', $sandicabang->sandicabang)
            ->where(function ($query) {
                $query->where('jenispenempatan', '20')
                    ->orWhere('jenispenempatan', '10');
            })
            ->get();

        $modifiedData = [];
        foreach ($datas as $item) {
            if ($item->norek != "" || $item->norek != null) {
                $modifiedData[] = [
                    'id' => $item->noaba,
                    'title' => ucwords(strtolower($item->namaaba . ' - ' . $item->namabank)),
                    'description' => $item->norek,
                ];
            }
        }

        // $cash = [
        //     "id" => "10010000101110",
        //     "title" => "Tunai - Cash",
        //     "description" => ""
        // ];

        // array_push($modifiedData, $cash);

        return $this->sendResponse($modifiedData, 'Sukses mengambil payment method');
    }
}
