<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LoanTopupModel extends Model
{
    protected $table = 'loan_topup';

    public $timestamps = false;

    public $fillable = [
        'id', 'amount', 'loan_id', 'created_by', 'created_at', 'tenant_id', 'status', 'reason'
    ];

    use HasFactory;
}
