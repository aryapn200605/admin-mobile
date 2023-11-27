<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\API\BaseController;
use App\Models\TenantsModel;
use App\Models\UsersModel;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class AuthApiController extends BaseController
{
    public function login(Request $request): JsonResponse
    {
        if (Auth::attempt(['username' => $request->username, 'password' => $request->password])) {
            $user = Auth::user();
            $tenant = TenantsModel::where('id', $user->tenant_id)->first();
            $client = UsersModel::where('id', $user->id)->first();

            $token = $user->createToken('dots_customer')->plainTextToken;

            if ($client->attempts >= 3) {
                return $this->sendError('Akun Terblokir', ['error' => 'Akun Terblokir']);
            }

            if ($request->tenantID !== $tenant->public_id) {
                return $this->sendError('Unauthorised client', ['error' => 'Unauthorized']);
            }

            if ($client->client_type !== "CUSTOMER") {
                return $this->sendError('Unauthorised type', ['error' => 'Unauthorized']);
            }

            $expirationTime = time() + 86400000;

            $response = [
                'exp' => $expirationTime,
                'accessToken' => $token,
                'user' => [
                    'id' => $user->id,
                    'username' => $user->username,
                    'firstName' => $user->first_name,
                    'lastName' => $user->last_name,
                    'email' => $user->email,
                    'tenantId' => $tenant->public_id,
                    'tenantReadableName' => $tenant->name,
                ],
            ];
            return response()->json($response, 200);
        } else {
            $user = UsersModel::where('username', $request->username)->first();

            if ($user) {
                $user->increment('attempts');
    
                if ($user->attempts >= 3) {
                    return $this->sendError('Akun Terblokir', ['error' => 'Akun Terblokir']);
                }
            } else {
                return $this->sendError('Akun tidak ditemukan', []);
            }

            return $this->sendError("Password Salah", ['error' => 'Wrong Password']);
        }
    }

    public function changePassword(Request $request): JsonResponse
    {
        $user = Auth::user();

        $data = $request->validate([
            'old_password' => 'required',
            'new_password' => 'required|min:6',
        ]);

        if (!Hash::check($data['old_password'], $user->password)) {
            return $this->sendError('Wrong password', ['error' => 'Password lama tidak sesuai']);
        }

        $user->password = Hash::make($data['new_password']);
        $user->save();

        $title = 'Password anda berhasil diubah';
        $this->sendNotification($title, '', 0, $user->id, $user->id);

        return $this->sendResponse(null, 'Kata sandi berhasil diubah.');
    }
}
