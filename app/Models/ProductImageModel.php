<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductImageModel extends Model
{
    public $timestamps = false;
    protected $table = 'image';
    protected $fillable = [
        'id','title','name','created_by','start_at','end_at','type','tenant_id'
    ];

    use HasFactory;
}
