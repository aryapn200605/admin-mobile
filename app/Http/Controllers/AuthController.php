<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\UsersModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Cookie;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;

class AuthController extends Controller
{
    public function loginForm()
    {
        return view('admin.login');
    }

    public function login(Request $request)
    {
        $request->validate([
            'username' => 'required',
            'password' => 'required',
        ]);

        $credentials = $request->only('username', 'password');
        $credentials['client_type'] = 'ADMIN';
        // echo "<pre>";
        // print_r($credentials);die;
        if (Auth::attempt($credentials)) {
            // $find_user = User::where('id',Auth::id())->first();
            $find_user = UsersModel::join('tenants', 'tenants.id', '=', 'users.tenant_id')
                ->select('users.*', 'tenants.core_database_dsn as database_dsn', 'tenants.name as tenants', 'tenants.public_id as database')
                ->where('users.id', Auth::id())
                ->first();

            $user_data = [
                'user_id' => Auth::id(),
                'username' => $request->username,
                'tenant_id' => $find_user->tenant_id,
                'tenant_name' => $find_user->tenants,
                'database' => $find_user->database,
                'database_dsn' => $find_user->database_dsn
            ];

            $minutes = 720;
            $cookie = Cookie::make('userLogin', json_encode($user_data), $minutes);

            return redirect()->intended('home')->withCookie($cookie)->withSuccess('Signed in');
        }

        return redirect()->route('login')->withError('Login details are not valid');
    }


    public function logout()
    {
        Session::flush();
        Auth::logout();

        return Redirect('login');
    }
}
