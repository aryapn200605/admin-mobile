<?php

namespace App\Http\Controllers;

use App\Models\NotificationModel;
use App\Models\TransactionsModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cookie;

class SetoranTabunganController extends Controller
{
    public function index()
    {
        $cookie = Cookie::get('userLogin');
        $decoded_cookie = json_decode($cookie);

        $datas = TransactionsModel::join('users', 'transactions.created_by', '=', 'users.id')
            ->select('transactions.*', 'users.customer_id', 'users.first_name')
            ->where('transactions.batch_id', 'mobile')
            ->where('transactions.tenant_id', $decoded_cookie->tenant_id)
            ->whereNotNull('transactions.saving_id')
            ->get();

        return view('admin.savings-deposit.index', ['datas' => $datas]);
    }

    public function detail($id)
    {
        $data = TransactionsModel::join('users', 'transactions.created_by', '=', 'users.id')
            ->select('transactions.*', 'users.customer_id', 'users.first_name')
            ->where('transactions.id',$id)
            ->first();

        // echo "<pre>";
        // print_r($data);die;

        return view('admin.savings-deposit.detail', ['data' => $data]);
    }

    public function accept(Request $request)
    {
        $id = $request->input('id');

        $cookie = Cookie::get('userLogin');
        $decoded_cookie = json_decode($cookie);

        $data = TransactionsModel::find($id);
        $data->status = 1;
        $data->save();

        $response_data['data'] = $data;

        $title = 'Setoran Simpanan anda diterima';
        $description = NotificationModel::where('parent', '06' . $id)->select('description')->first();
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

        $data = TransactionsModel::find($id);
        $data->status = 2;
        $data->save();

        $response_data['data'] = $data;

        $title = 'Setoran Simpanan anda ditolak';
        $description = NotificationModel::where('parent', '06' . $id)->select('description')->first();
        $descriptionObject = json_decode($description->description, true);
        $descriptionObject['Alasan Penolakan'] = $reason;
        $newDescriptionString = json_encode($descriptionObject);

        $user_id = $data->created_by;
        $created_by = $decoded_cookie->user_id;
        $this->sendNotification($title, $newDescriptionString, 2, $user_id, $created_by);

        return json_encode($response_data);
    }
}
