<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TenantsModel extends Model
{
    protected $table = 'tenants';
    
    use HasFactory;
}
