<?php

use App\Http\Controllers\Api\AuthApiController;
use App\Http\Controllers\Api\DepositoApiController;
use App\Http\Controllers\Api\LoanApiController;
use App\Http\Controllers\Api\NotificationApiController;
use App\Http\Controllers\Api\OfficeApiController;
use App\Http\Controllers\Api\ProductImageApiController;
use App\Http\Controllers\Api\ReservationApiController;
use App\Http\Controllers\Api\SavingApiController;
use App\Http\Controllers\Api\TenantApiController;
use Illuminate\Support\Facades\Route;

use function PHPUnit\Framework\returnSelf;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::controller(AuthApiController::class)->group(function () {
    Route::post('login', 'login');
});

Route::get('tenant/{id}', [TenantApiController::class, 'findTenantById']);

Route::get('hehe', function() {
    return time() + 86400;
});

Route::get('topup-reason', [TenantApiController::class, 'topupReason']);

// Route::post('create', [ReservationApiController::class, 'createCorporateUser']);

Route::middleware(['auth:sanctum'])->group(function () {
    Route::get('check-token', );

    Route::post('change-password', [AuthApiController::class, 'changePassword']);

    Route::post('create-reservation', [ReservationApiController::class, 'createReservation']);
    Route::get('reservation/{id}', [ReservationApiController::class, 'findReservationById']);
    
    Route::get('tenants', [TenantApiController::class, 'findAllTenants']);

    Route::get('payment-method/{type}/{id}', [TenantApiController::class, 'findPaymentMethod']);

    Route::get('office', [OfficeApiController::class, 'findAllOffice']);

    Route::get('image', [ProductImageApiController::class, 'productImage']);

    Route::prefix('saving')->group(function () {
        Route::get('', [SavingApiController::class, 'findSavingByCustomerId']);
        Route::get('product-type', [SavingApiController::class, 'findSavingProductType']);
        Route::get('history/{id}', [SavingApiController::class, 'findSavingTranactionBySavingId']);
        Route::get('{id}', [SavingApiController::class, 'findSavingById']);
        
        Route::post('', [SavingApiController::class, 'createSaving']);
        Route::post('deposit', [SavingApiController::class, 'transactionDepositSaving']);
    });

    Route::prefix('loan')->group(function () {
        Route::get('', [LoanApiController::class, 'findLoanByCustomerId']);
        Route::get('product-type', [LoanApiController::class, 'findLoanProductType']);
        Route::get('upcoming', [LoanApiController::class, 'findLoanRepaymentScheduleUpcoming']);
        Route::get('{id}', [LoanApiController::class, 'findLoanById']);
        Route::get('bill/{id}', [LoanApiController::class, 'findLoanRepaymentScheduleUpcoming']);
        Route::get('now/{id}', [LoanApiController::class, 'findLoanRepaymentScheduleByLoanID']);

        Route::post('', [LoanApiController::class, 'createLoan']);
        Route::post('repay', [LoanApiController::class, 'transactionLoanPayment']);
        Route::post('topup', [LoanApiController::class, 'loanTopup']);
    });

    Route::prefix('deposit')->group(function () {
        Route::get('', [DepositoApiController::class, 'findDepositByCustomerId']);
        Route::get('product-type', [DepositoApiController::class, 'findDepositProductType']);
        Route::get('{id}', [DepositoApiController::class, 'findDepositById']);
        
        Route::post('', [DepositoApiController::class, 'createDeposit']);
    });
    
    Route::prefix('notification')->group(function () {
        Route::get('', [NotificationApiController::class, 'findAllNotification']);
        Route::get('{id}', [NotificationApiController::class, 'notificationStatus']);
    });
});
