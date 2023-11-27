<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Api\SavingApiController;
use App\Models\NotificationModel;
use App\Models\SavingsModel;
use App\Models\TenantsModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cookie;
use Illuminate\Support\Facades\DB;

class SavingController extends Controller
{
    public function index()
    {
        $cookie = Cookie::get('userLogin');
        $decoded_cookie = json_decode($cookie);
    
        $datas = DB::table('savings')
            ->select('savings.*', 'users.first_name')
            ->join('tenants', 'savings.tenant_id', '=', 'tenants.id')
            ->join('users', 'savings.customer_id', '=', 'users.customer_id')
            ->where('savings.tenant_id', $decoded_cookie->tenant_id)
            ->orderBy('savings.status')
            ->get();
    
        $tipe = $this->tipeProduk($decoded_cookie->tenant_id);
    
        // Membuat array asosiatif untuk memetakan kodeproduk ke namafull
        $produkMapping = [];
        foreach ($tipe as $produk) {
            $produkMapping[$produk->kodeproduk] = $produk->namafull;
        }
    
        // Mengganti $datas->productype dengan $tipe->namafull sesuai dengan kodeproduk
        foreach ($datas as $data) {
            $data->product_type = $produkMapping[$data->product_type] ?? $data->product_type;
        }
    
        return view('admin.savings.index', ['datas' => $datas]);
    }

    public function tipeProduk($tenant)
    {
        $tenant = TenantsModel::where('id', $tenant)->first();
        $dsn = $tenant->core_database_dsn;

        $data = $this->sqlServerConnection($dsn)->table('tabungan_setup')
        ->select('kodeproduk', 'namafull')
        ->get();

        return $data;
    }

    public function accept(Request $request)
    {
        $id = $request->input('id');

        $cookie = Cookie::get('userLogin');
        $decoded_cookie = json_decode($cookie);

        $data = SavingsModel::find($id);
        $data->status = 1;
        $data->save();

        $response_data['data'] = $data;

        $title = 'Pengajuan Simpanan anda diterima';
        $description = NotificationModel::where('parent', '02' . $id)->select('description')->first();
        $user_id = $data->created_by;
        $created_by = $decoded_cookie->user_id;
        $this->sendNotification($title, $description->description, 1, $user_id, $created_by);

        return json_encode($response_data);
    }

    public function reject(Request $request)
    {
        $reason = $request->input('reason');
        $id = $request->input('id');

        $cookie = Cookie::get('userLogin');
        $decoded_cookie = json_decode($cookie);

        $data = SavingsModel::find($id);
        $data->status = 2;
        $data->save();

        $response_data['data'] = $data;

        $title = 'Pengajuan Simpanan anda ditolak';
        $description = NotificationModel::where('parent', '02' . $id)->select('description')->first();
        $descriptionObject = json_decode($description->description, true);
        $descriptionObject['Alasan Penolakan'] = $reason;
        $newDescriptionString = json_encode($descriptionObject);

        $user_id = $data->created_by;
        $created_by = $decoded_cookie->user_id;
        $this->sendNotification($title, $newDescriptionString, 2, $user_id, $created_by);

        return json_encode($response_data);
    }
}
