<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class NotificationModel extends Model
{
    public $timestamps = false;
    protected $table = 'notification';

    protected $fillable = [
        'id', 'title', 'description', 'type', 'user_id', 'status', 'created_at', 'created_by', 'parent'
    ];

    use HasFactory;
}
