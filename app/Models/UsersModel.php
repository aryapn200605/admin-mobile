<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UsersModel extends Model
{
    public $timestamps = false;
    protected $table = 'users';
    protected $fillable = [
        'email', 'username', 'password', 'is_active', 'email_confirmed_at', 'password', 'first_name', 'last_name', 'created_at', 'deleted_at', 'customer_id', 'account_officer_id', 'client_type', 'tenant_id', 'branch_id', "attempts"
    ];
    use HasFactory;
}
