<?php

namespace App\Http\Controllers;

use App\Models\UsersModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\Cookie;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class CustomersController extends Controller
{

    public function index()
    {
        $cookie = Cookie::get('userLogin');
        $decoded_cookie = json_decode($cookie);

        $datas = UsersModel::where('tenant_id', $decoded_cookie->tenant_id)
            ->where('client_type', 'CUSTOMER')
            ->get();

        foreach ($datas as $data) {
            $data->created_at = date('d F Y', strtotime($data->created_at));
        }

        return view('admin.customers.index', ['datas' => $datas]);
    }

    public function mobile_registration()
    {
        return view('admin.customers.register_mobile');
    }

    public function create(Request $request)
    {
        $cookie = Cookie::get('userLogin');
        $decoded_cookie = json_decode($cookie);

        $data = $this->sqlServerConnection($decoded_cookie->database_dsn)->table('cif')->select('namalengkap')->where('cif', $request->cif)->first();

        $cleanedString = preg_replace('/[^a-zA-Z ]/', ' ', $data->namalengkap);
        $parts = explode(' ', $cleanedString);
        $combined = implode('_', $parts);
        $combined = strtolower($combined);

        $username = $combined . substr($decoded_cookie->tenant_id, -2) . substr($request->cif, -4);

        // echo "<pre>";
        // print_r($username);
        // die;

        $user = new UsersModel();
        $user->id = $this->generateUniqueValueAsString();
        $user->username = $username;
        $user->password = Hash::make($username);
        $user->first_name = $request->namalengkap;
        $user->client_type = "CUSTOMER";
        $user->tenant_id = $decoded_cookie->tenant_id;
        $user->customer_id = $request->cif;
        $user->created_at = now();

        $user->save();

        return redirect('/customers/');
    }

    public function find_customer(Request $request)
    {
        $customer_name = $request->input('customer_name');

        $cookie = Cookie::get('userLogin');
        $decoded_cookie = json_decode($cookie);

        $dsn = $decoded_cookie->database_dsn;

        $find_customer = $this->sqlServerConnection($dsn)->table('cif')->where('namalengkap', 'like', '%' . $customer_name . '%')->get();

        $response_data['customers'] = $find_customer;

        return json_encode($response_data);
    }

    public function select_customer(Request $request)
    {
        $cif = $request->input('cif');

        $cookie = Cookie::get('userLogin');
        $decoded_cookie = json_decode($cookie);

        $dsn = $decoded_cookie->database_dsn;

        $select_customer = $this->sqlServerConnection($dsn)->table('cif')->where('cif', $cif)->first();

        $response_data['customer'] = $select_customer;

        return json_encode($response_data);
    }

    public function unblock_customer(String $id)
    {
        $user = UsersModel::find($id);

        if ($user) {
            $user->update(['attempts' => 0]);

            $response_data = [
                'success' => true,
                'message' => 'User unblocked successfully.',
            ];
        } else {
            $response_data = [
                'success' => false,
                'message' => 'User not found.',
            ];
        }

        return json_encode($response_data);
    }
}
