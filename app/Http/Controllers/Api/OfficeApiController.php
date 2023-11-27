<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\API\BaseController;
use App\Models\TenantsModel;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Auth;

class OfficeApiController extends BaseController
{
    public function findAllOffice(): JsonResponse
    {
        $user = Auth::user();
        
        $tenant = TenantsModel::where('id', $user->tenant_id)->first();
        $dsn = $tenant->core_database_dsn;
        
        $data = $this->sqlServerConnection($dsn)->table('company_setup')
        ->select("sandicabang", "nama_bank", "alamat", "latitude", "longitude")
        ->get();
        
        $result = [];

        foreach ($data as $item) {
            $result[] = [
                "id" => $item->sandicabang,
                "name" => trim(explode("-", $item->nama_bank)[1] ?? ''),
                "address" => $item->alamat,
                "latitude" => $item->latitude,
                "longitude" => $item->longitude
            ];
        }
        
        return $this->sendResponse($result, 'Office successfully find');
    }
}
