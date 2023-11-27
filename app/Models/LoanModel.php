<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LoanModel extends Model
{
    protected $table = 'loans';

    protected $fillable = [
        'id', 'customer_id', 'external_id', 'current_balance', 'jangkawaktu', 'available_balance', 'status', 'product_type', 'last_synced_at', 'deleted_at', 'created_by', 'updated_by', 'deleted_by'
    ];
    use HasFactory;
}
