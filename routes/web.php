<?php

use App\Http\Controllers\AttendanceReservationController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\BayarTagihanController;
use App\Http\Controllers\CustomersController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\DepositController;
use App\Http\Controllers\LoanController;
use App\Http\Controllers\LoanTopupController;
use App\Http\Controllers\PaymentMethodController;
use App\Http\Controllers\ProductImageController;
use App\Http\Controllers\SavingController;
use App\Http\Controllers\SetoranTabunganController;
use App\Http\Controllers\TransactionController;
use App\Http\Controllers\UsersContorller;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return redirect()->route('login');
});

Route::prefix('qrcode')->group(function () {
    Route::get('{action}/{id}', [AttendanceReservationController::class, 'qrAction']);
    Route::get('{id}', [AttendanceReservationController::class, 'showQRCode']);
});

Route::get('mobile/FAQ', function() {
    return view('FAQ.index');
});

Route::middleware(['guest'])->group(function () {
    Route::get('login', [AuthController::class, 'loginForm'])->name('login');
    Route::post('login', [AuthController::class, 'login']);
});

Route::middleware(['auth'])->group(function () {
    Route::get('home', [DashboardController::class, 'index'])->name('home');

    Route::prefix('transaction')->group(function () {
        Route::get('batch', [TransactionController::class, 'index'])->name('batch');
        Route::get('detail/{id}', [TransactionController::class, 'detail'])->name('detail');
    });

    Route::prefix('reservation')->group(function () {
        Route::get('management', [AttendanceReservationController::class, 'index'])->name('reservation-management');
        Route::get('accept', [AttendanceReservationController::class, 'accept'])->name('reservation-accept');
        Route::get('reject', [AttendanceReservationController::class, 'reject'])->name('reservation-reject');
    });

    Route::prefix('customers')->group(function () {
        Route::get('', [CustomersController::class, 'index'])->name('customers');
        Route::get('registration', [CustomersController::class, 'mobile_registration'])->name('customers-registration');
        Route::post('find-customer', [CustomersController::class, 'find_customer'])->name('customers-find-customer');
        Route::get('unblock-customer/{id}', [CustomersController::class, 'unblock_customer'])->name('unblock-customer');
        Route::get('select-customer', [CustomersController::class, 'select_customer'])->name('customers-select-customer');
        Route::post('create-customer', [CustomersController::class, 'create'])->name('customers-create');
    });

    Route::prefix('product-image')->group(function () {
        Route::get('', [ProductImageController::class, 'index'])->name('product-image');
        Route::get('create', [ProductImageController::class, 'create'])->name('product-image-create');
        Route::post('store', [ProductImageController::class, 'store'])->name('product-image-store');
        Route::patch('update', [ProductImageController::class, 'update'])->name('product-image-update');
    });

    Route::prefix('payment-method')->group(function () {
        Route::get('', [PaymentMethodController::class, 'index'])->name('payment-method');
        Route::get('create', [PaymentMethodController::class, 'create'])->name('payment-method-create');
        Route::post('store', [PaymentMethodController::class, 'store'])->name('payment-method-store');
        Route::get('{id}/edit', [PaymentMethodController::class, 'edit'])->name('payment-method-edit');
        Route::post('update/{id}', [PaymentMethodController::class, 'update'])->name('payment-method-update');
        Route::get('delete/{id}', [PaymentMethodController::class, 'delete'])->name('payment-method-delete');
    });

    Route::prefix('savings')->group(function () {
        Route::get('', [SavingController::class, 'index'])->name('savings');
        Route::get('accept', [SavingController::class, 'accept'])->name('saving-accept');
        Route::get('reject', [SavingController::class, 'reject'])->name('saving-reject');
    });

    Route::prefix('loans')->group(function () {
        Route::get('', [LoanController::class, 'index'])->name('loans');
        Route::get('accept', [LoanController::class, 'accept'])->name('loans-accept');
        Route::get('reject', [LoanController::class, 'reject'])->name('loans-reject');
    });

    Route::prefix('deposits')->group(function () {
        Route::get('', [DepositController::class, 'index'])->name('deposits');
        Route::get('accept', [DepositController::class, 'accept'])->name('deposits-accept');
        Route::get('reject', [DepositController::class, 'reject'])->name('deposits-reject');
    });

    Route::prefix('savings-deposit')->group(function () {
        Route::get('', [SetoranTabunganController::class, 'index'])->name('savings-deposit');
        Route::get('detail/{id}', [SetoranTabunganController::class, 'detail'])->name('savings-deposit-detail');
        Route::get('accept', [SetoranTabunganController::class, 'accept'])->name('saving-deposit-accept');
        Route::get('reject', [SetoranTabunganController::class, 'reject'])->name('saving-deposit-reject');
    });

    Route::prefix('loan-repay')->group(function () {
        Route::get('', [BayarTagihanController::class, 'index'])->name('loan-repay');
        Route::get('detail/{id}', [BayarTagihanController::class, 'detail'])->name('loan-repay-detail');
        Route::get('accept', [BayarTagihanController::class, 'accept'])->name('bayar-tagihan-accept');
        Route::get('reject', [BayarTagihanController::class, 'reject'])->name('bayar-tagihan-reject');
    });

    Route::prefix('loan-topup')->group(function () {
        Route::get('', [LoanTopupController::class, 'index'])->name('loan-topup');
        Route::get('reject', [LoanTopupController::class, 'reject'])->name('topup-reject');
        Route::get('accept', [LoanTopupController::class, 'accept'])->name('topup-accept');
    });

    Route::get('logout', [AuthController::class, 'logout'])->name('logout');
});
