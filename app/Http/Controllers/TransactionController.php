<?php

namespace App\Http\Controllers;

use App\Models\TransactionsBatchesModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cookie;
use Illuminate\Support\Facades\DB;

class TransactionController extends Controller
{


    public function index()
    {
        $cookie = Cookie::get('userLogin');
        $decoded_cookie = json_decode($cookie);

        $datas = DB::table('transaction_batches')
            ->select('transaction_batches.*', 'tenants.name as tenants')
            ->join('tenants', 'transaction_batches.tenant_id', '=', 'tenants.id')
            ->where('transaction_batches.tenant_id',$decoded_cookie->tenant_id)
            ->get();

        return view('admin.transaction.index', ['datas' => $datas]);
    }

    public function detail(String $id)
    {
        $datas = DB::table('transactions')->where('batch_id', '=', $id)->get();

        return view('admin.transaction.detail', ['datas' => $datas]);
    }
}
