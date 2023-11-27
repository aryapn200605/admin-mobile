<?php

namespace App\Http\Controllers;

use App\Models\AttendanceReservation;
use App\Models\DepositsModel;
use App\Models\LoanModel;
use App\Models\LoanTopupModel;
use App\Models\SavingsModel;
use App\Models\TransactionsModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cookie;

class DashboardController extends Controller
{
    public function index()
    {
        $cookie = Cookie::get('userLogin');
        $decoded_cookie = json_decode($cookie);

        $reservasi = AttendanceReservation::where('tenant_id', $decoded_cookie->tenant_id)->where('status', 3)->count();
        $saving = SavingsModel::where('tenant_id', $decoded_cookie->tenant_id)->where('status', 0)->count();
        $loan = LoanModel::where('tenant_id', $decoded_cookie->tenant_id)->where('status', 0)->count();
        $deposit = DepositsModel::where('tenant_id', $decoded_cookie->tenant_id)->where('status', 0)->count();
        $setoran = TransactionsModel::where('tenant_id', $decoded_cookie->tenant_id)
            ->where("batch_id", "mobile")
            ->where('status', 0)
            ->whereNotNull('saving_id')
            ->count();
        $tagihan = TransactionsModel::where('tenant_id', $decoded_cookie->tenant_id)
            ->where("batch_id", "mobile")
            ->where('status', 0)
            ->whereNotNull('loan_id')
            ->count();
        $topup = LoanTopupModel::where('tenant_id', $decoded_cookie->tenant_id)->where('status', 0)->count();

        $data = [
            'reservasi' => $reservasi,
            'saving' => $saving,
            'loan' => $loan,
            'deposit' => $deposit,
            'setoran' => $setoran,
            'tagihan' => $tagihan,
            'topup' => $topup,
        ];

        return view('admin.home', $data);
    }

    public function transaction()
    {
        $cookie = Cookie::get('userLogin');
        $decoded_cookie = json_decode($cookie);

        $saving_transaction = TransactionsModel::where('tenant_id', $decoded_cookie->tenant_id)
            ->where('batch_id', 'mobile')
            ->whereNotNull('saving_id')
            ->count();

        $deposit_transaction = TransactionsModel::where('tenant_id', $decoded_cookie->tenant_id)
            ->where('batch_id', 'mobile')
            ->whereNotNull('deposit_id')
            ->count();

        $loan_transaction = TransactionsModel::where('tenant_id', $decoded_cookie->tenant_id)
            ->where('batch_id', 'mobile')
            ->whereNotNull('loan_id')
            ->count();

        $response_data['saving_transaction'] = $saving_transaction;
        $response_data['deposit_transaction'] = $deposit_transaction;
        $response_data['loan_transaction'] = $loan_transaction;

        return json_encode($response_data);
    }
}
