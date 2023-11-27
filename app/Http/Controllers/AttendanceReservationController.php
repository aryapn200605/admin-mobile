<?php

namespace App\Http\Controllers;

use App\Models\AttendanceReservation;
use App\Models\NotificationModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cookie;
use Illuminate\Support\Facades\DB;

class AttendanceReservationController extends Controller
{
    public function index()
    {

        $resultTemp = [];
        $cookie = Cookie::get('userLogin');
        $decoded_cookie = json_decode($cookie);

        $datas = DB::table('attendance_reservations')
            ->join('tenants', 'attendance_reservations.tenant_id', '=', 'tenants.id')
            ->leftjoin('users', 'attendance_reservations.created_by', '=', 'users.id')
            ->select('attendance_reservations.*', 'users.first_name')
            ->where('attendance_reservations.tenant_id', $decoded_cookie->tenant_id)
            ->where('status', 3)
            ->get();

        $resultTemp = [];

        $office = $this->findOffice($decoded_cookie->tenant_id);

        foreach ($datas as $data) {
            $date = date_create(substr($data->attend_at_start, 0, 9));
            $formatted_date = date_format($date, "d F Y");
            $result = new \stdClass();
            $result->id = $data->id;

            $bankName = '';
            foreach ($office as $officeData) {
                if ($officeData->sandicabang == $data->branch_id) {
                    $bankName = $officeData->nama_bank;
                    break;
                }
            }
            $result->branch_id = $bankName;

            $result->destination_service = $data->destination_service;
            $result->reason = $data->reason;
            $result->day = $formatted_date;
            $result->time = substr($data->attend_at_start, 11, 8) . ' - ' . substr($data->attend_at_end, 11, 8);
            $result->created_by = $data->created_by;
            $result->tenant_id = $data->tenant_id;
            $result->status = $data->status;
            $result->first_name = $data->first_name;

            $resultTemp[] = $result;
        }

        return view('admin.reservation.index', ['datas' => $resultTemp]);
    }

    public function accept(Request $request)
    {
        $id = $request->input('id');

        $cookie = Cookie::get('userLogin');
        $decoded_cookie = json_decode($cookie);

        $attendance_reservation = AttendanceReservation::find($id);
        $attendance_reservation->status = 1;
        $attendance_reservation->save();

        $response_data['attendance_reservation'] = $attendance_reservation;

        $title = 'Pengajuan Reservasi anda diterima';
        $description = NotificationModel::where('parent', '01' . $id)->select('description')->first();
        $user_id = $attendance_reservation->created_by;
        $created_by = $decoded_cookie->user_id;
        $this->sendNotification($title, $description->description, 1, $user_id, $created_by);

        return json_encode($response_data);
    }
    
    public function showQRCode(String $id)
    {
        $notification = NotificationModel::where('id', $id)->first();
        
        $data['description'] = json_decode($notification->description, true);
        $data['data'] = $notification;

        $reservation = substr($data['data']->parent, 2);
        
        $attendence = AttendanceReservation::where('id', $reservation)->first();

        if ($attendence->status == 3) {
            return view('qrcode.index', compact('data'));
        } elseif ($attendence->status == 2) {
            return view('qrcode.reject', compact('data'));
        } else {
            return view('qrcode.success', compact('data'));
        }
    }
    
    public function qrAction(String $action, String $id)
    {
        $id = substr($id, 2);
    
        $attendance = AttendanceReservation::where('id', $id)->first();
    
        if ($action == "accept") {
            $attendance->update(['status' => 1]);
        } elseif ($action == "reject") {
            $attendance->update(['status' => 2]);
        }
    }
}
