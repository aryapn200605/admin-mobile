<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PaymentMethodModel extends Model
{
    public $timestamps = false;
    protected $table = 'payment_method';
    protected $fillable = [
        'title','description','tenant_id','created_at','created_by','is_deleted'
    ];
    use HasFactory;
}
