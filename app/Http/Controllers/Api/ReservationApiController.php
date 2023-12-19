<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\API\BaseController;
use App\Models\AttendanceReservation;
use App\Models\TenantsModel;
use Carbon\Carbon;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use QrCode;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\DB;
use PhpParser\Node\Expr\Cast\Object_;

class ReservationApiController extends BaseController
{
    public function createReservation(Request $request): JsonResponse
    {
        $user = Auth::user();

        $reservation = new AttendanceReservation();

        $reservation->id = $this->generateUniqueValueAsString();
        $reservation->branch_id = $request->branchId;
        $reservation->destination_service = $request->destinationService;
        $reservation->reason = $request->reason;
        $reservation->attend_at_start = $request->attendAtStart;
        $reservation->attend_at_end = $request->attendAtEnd;
        $reservation->created_at = now();
        $reservation->created_by = $user->id;
        $reservation->tenant_id = $user->tenant_id;
        $reservation->status = 3;

        $reservation->save();

        $tenant = TenantsModel::where('id', $user->tenant_id)->first();
        $dsn = $tenant->core_database_dsn;

        $data = $this->sqlServerConnection($dsn)->table('company_setup')
            ->select('*')
            ->where('sandicabang', $request->branchId)
            ->first();

        $carbon = Carbon::parse($request->attendAtStart);

        $date = $carbon->isoFormat('dddd, D MMMM YYYY', 'Do MMMM YYYY');

        if ($request->destinationService == 1) {
            $services = 'Teller';
        } elseif ($request->destinationService == 2) {
            $services = 'Customer Service';
        } else {
            $services = 'Lainnya';
        }

        $title = 'Pengajuan Reservasi anda ';
        $description = json_encode([
            'Kantor Tujuan'  => $data->nama_bank,
            'Layanan Tujuan' => $services,
            'Alasan'        => $request->reason,
            'Tanggal Pertemuan'  => $date,
            'Pukul'    => preg_replace('/^(\d{2})(\d{2})-(\d{2})(\d{2})$/', '$1:$2 - $3:$4', $request->time)
        ]);

        $parent = "01" . $reservation->id;

        $this->sendNotification($title, $description, 1, $user->id, $user->id, $parent);

        return $this->sendResponse($description, 'Reservation created successfully');
    }

    public function findReservationById(String $id): JsonResponse
    {
        $user = Auth::user();

        $data = AttendanceReservation::where('id', $id)->first();

        return $this->sendResponse($data, "Successfully find reservation by id");
    }
    
    public function createCorporateUser(Request $request): JsonResponse
    {
        // $parsed_uri = parse_url("postgres://postgres:kreasinusantara@10.8.0.16:5432?database=dots-mobile-v2");

        // $username = isset($parsed_uri['user']) ? $parsed_uri['user'] : '';
        // $password = isset($parsed_uri['pass']) ? $parsed_uri['pass'] : '';
        // $host = $parsed_uri['host'];
        // $port = isset($parsed_uri['port']) ? $parsed_uri['port'] : '';
    
        // parse_str($parsed_uri['query'], $query_params);
        // $database = isset($query_params['database']) ? $query_params['database'] : '';
    
        // Config::set("database.connections.$database", [
        //     'driver' => 'pgsql',
        //     'host' => $host,
        //     'port' => $port,
        //     'database' => $database,
        //     'username' => $username,
        //     'password' => $password,
        //     'charset' => 'utf8',
        //     'prefix' => '',
        //     'schema' => 'public',
        //     'sslmode' => 'prefer',
        // ]);

        // $connection = DB::connection($database);
        // $connection->enableQueryLog();
    
        $data = [];

        foreach ($request->data as $userData) {
            $user = new \stdClass();

            $user->id = $this->generateUniqueValueAsString();
            $user->is_active = false;
            $user->created_at = now();
            $user->password = password_hash($userData['username'], PASSWORD_DEFAULT, ['cost' => 4]);
            $user->username = $userData['username'];
            $user->first_name = $userData['name'];
            $user->client_type = "ADMIN";
            $user->tenant_id = $userData['public_id'];
            // $user->account_officer_id = $userData['kode_ao'];
            // $user->branch_id = sprintf("%03d", $userData['branch_id']);
            $user->branch_id = "001";
            // $user->pwd = password_verify($userData['pwd1'], $userData['pwd2']);
            
            // $connection->table('users')->insert((array) $user);

            $data[] = $user;
        }

        return $this->sendResponse($data, "Data API");
    }
}
