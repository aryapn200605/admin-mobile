<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AttendanceReservation extends Model
{
    protected $table = 'attendance_reservations';
    
    public $timestamps = false;

    protected $fillable = [
        'id', 'branch_id','destination_service','reason','attend_at_start','attend_at_end','tenant_id','deleted_at','created_at','created_by', 'status'
    ];

    use HasFactory;
}
