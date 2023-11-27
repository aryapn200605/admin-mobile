<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TransactionsModel extends Model
{
    protected $table = 'transactions';
    protected $keyType = 'string';

    public $timestamps = false;

    protected $fillable = [
        'id', 'local_id', 'amount', 'saving_id', 'deposit_id', 'loan_id', 'transaction_type', 'created_at', 'created_by', 'status', 'tenant_id', 'branch_id', 'batch_id'
    ];

    use HasFactory;
}
