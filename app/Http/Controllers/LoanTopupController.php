<?php

namespace App\Http\Controllers;

use App\Models\LoanTopupModel;
use App\Models\NotificationModel;
use App\Models\SavingsModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cookie;
use Illuminate\Support\Facades\DB;

class LoanTopupController extends Controller
{
    public function index()
    {
        $cookie = Cookie::get('userLogin');
        $decoded_cookie = json_decode($cookie);

        $datas = LoanTopupModel::select('loan_topup.*', 'users.first_name', 'users.customer_id')
            ->join('users', 'loan_topup.created_by', '=', 'users.id')
            ->where('loan_topup.tenant_id', $decoded_cookie->tenant_id)
            ->get();

        return view('admin.topup.index', ['datas' => $datas]);
    }

    public function accept(Request $request)
    {
        $id = $request->input('id');
        
        $cookie = Cookie::get('userLogin');
        $decoded_cookie = json_decode($cookie);

        $data = LoanTopupModel::find($id);
        $data->status = 1;
        $data->save();

        $response_data['data'] = $data;

        $title = 'Pengajuan Top up anda diterima';
        $description = NotificationModel::where('parent', '05' . $id)->select('description')->first();
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

        $data = LoanTopupModel::find($id);
        $data->status = 2;
        $data->save();

        $response_data['data'] = $data;

        $title = 'Pengajuan Top up anda ditolak';
        $description = NotificationModel::where('parent', '05' . $id)->select('description')->first();
        $descriptionObject = json_decode($description->description, true);
        $descriptionObject['Alasan Penolakan'] = $reason;
        $newDescriptionString = json_encode($descriptionObject);

        $user_id = $data->created_by;
        $created_by = $decoded_cookie->user_id;
        $this->sendNotification($title, $newDescriptionString, 2, $user_id, $created_by);

        return json_encode($response_data);
    }
}
