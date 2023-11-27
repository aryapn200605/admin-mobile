<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\UsersModel;
use Carbon\Carbon;
use DateTime;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class UsersContorller extends Controller
{
    public function index()
    {
        $users = User::all();

        return view('admin.users.index', ['users' => $users]);
    }

    public function detail(String $id)
    {
        $users = DB::table('users')
            ->select('users.*', 'tenants.name as tenants')
            ->join('tenants', 'tenants.id', '=', 'users.tenant_id')
            ->where('users.id', '=', $id)
            ->first();

        return view('admin.users.detail', ['users' => $users]);
    }

    public function edit(String $id)
    {
        $user = DB::table('users')
            ->select('users.*', 'tenants.name as tenants')
            ->join('tenants', 'tenants.id', '=', 'users.tenant_id')
            ->where('users.id', '=', $id)
            ->first();

        return view('admin.users.edit', ['user' => $user]);
    }

    public function update(Request $request, $id)
    {
        $data_save = UsersModel::find($id);
    
        if (!$data_save) {
            return redirect('/user/management')->with('error', 'Pengguna tidak ditemukan.');
        }

        $data_save->username = $request->username;
        $data_save->email = $request->email;
        $data_save->first_name = $request->first_name;
        $data_save->last_name = $request->last_name;
        $data_save->save();
    
        return redirect('/user/management')->with('success', 'Data pengguna telah diperbarui.');
    }

    public function destroy(Request $request)
    {
        $id = $request->input('id');
        $item = UsersModel::find($id);

        if (!$item) {
            return redirect()->route('management')->with('error', 'Item tidak ditemukan.');
        }

        $item->delete();

        // return redirect()->route('management')->with('success', 'Item telah dihapus.');
    }
}
