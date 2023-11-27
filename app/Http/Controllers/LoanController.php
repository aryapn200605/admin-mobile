<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Api\LoanApiController;
use App\Models\LoanModel;
use App\Models\NotificationModel;
use App\Models\TenantsModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cookie;
use Illuminate\Support\Facades\DB;

class LoanController extends Controller
{
    public function index()
    {
        $cookie = Cookie::get('userLogin');
        $decoded_cookie = json_decode($cookie);

        $datas = DB::table('loans')
        ->select('loans.*', 'users.first_name')
        ->join('tenants', 'loans.tenant_id', '=', 'tenants.id')
        ->join('users', 'loans.customer_id', '=', 'users.customer_id')
        ->where('loans.tenant_id',$decoded_cookie->tenant_id)
        ->get();

        $tipe = $this->tipeProduk($decoded_cookie->tenant_id);

        $produkMapping = [];
        foreach ($tipe as $produk) {
            $produkMapping[$produk->kodeprodukcrd] = $produk->namafull;
        }

        foreach ($datas as $data) {
            $data->product_type = $produkMapping[$data->product_type] ?? $data->product_type;
        }

        return view('admin.loans.index', ['datas' => $datas]);
    }

    public function tipeProduk($tenant)
    {
        $tenant = TenantsModel::where('id', $tenant)->first();
        $dsn = $tenant->core_database_dsn;

        $data = $this->sqlServerConnection($dsn)->table('crd_setup')
        ->select('kodeprodukcrd', 'namafull')
        ->get();

        return $data;
    }

    public function accept(Request $request)
    {
        $id = $request->input('id');

        $cookie = Cookie::get('userLogin');
        $decoded_cookie = json_decode($cookie);

        $data = LoanModel::find($id);
        $data->status = 1;
        $data->save();

        $response_data['data'] = $data;

        $title = 'Pengajuan Pinjaman anda diterima';
        $description = NotificationModel::where('parent', '03' . $id)->select('description')->first();
        $user_id = $data->created_by;
        $created_by = $decoded_cookie->user_id;
        $this->sendNotification($title, $description->description, 1, $user_id, $created_by);

        return json_encode($response_data);
    }

    public function reject(Request $request)
    {
        $id = $request->input('id');
        $reason = $request->input('reason');

        $cookie = Cookie::get('userLogin');
        $decoded_cookie = json_decode($cookie);

        $data = LoanModel::find($id);
        $data->status = 2;
        $data->save();

        $response_data['data'] = $data;

        $title = 'Pengajuan Pinjaman anda ditolak';
        $description = NotificationModel::where('parent', '03' . $id)->select('description')->first();
        $descriptionObject = json_decode($description->description, true);
        $descriptionObject['Alasan Penolakan'] = $reason;
        $newDescriptionString = json_encode($descriptionObject);

        $user_id = $data->created_by;
        $created_by = $decoded_cookie->user_id;
        $this->sendNotification($title, $newDescriptionString, 2, $user_id, $created_by);

        return json_encode($description);
    }
}
