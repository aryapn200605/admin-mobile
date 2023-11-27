<?php

namespace App\Http\Controllers;

use App\Models\NotificationModel;
use App\Models\PaymentMethodModel;
use App\Models\TenantsModel;
use GuzzleHttp\Psr7\Request;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\DB;

class Controller extends BaseController
{
    use AuthorizesRequests, ValidatesRequests;

    private $connection;

    protected function sqlServerConnection($dsn)
    {
        $parsed_uri = parse_url($dsn);

        $username = isset($parsed_uri['user']) ? $parsed_uri['user'] : '';
        $password = isset($parsed_uri['pass']) ? $parsed_uri['pass'] : '';
        $host = $parsed_uri['host'];
        $port = isset($parsed_uri['port']) ? $parsed_uri['port'] : '';

        parse_str($parsed_uri['query'], $query_params);
        $connection = isset($query_params['database']) ? $query_params['database'] : '';

        Config::set(["database.connections.$connection" => [
            'driver' => 'sqlsrv',
            'host' => $host,
            'port' => $port,
            'database' => $connection,
            'username' => $username,
            'password' => $password,
            'charset' => 'utf8',
            'prefix' => '',
            'prefix_indexes' => true,
            'options' => extension_loaded('sqlsrv') ? array_filter([
                "Database" => $connection,
                "UID" => $username,
                "PWD" => $password,
                "CharacterSet" => "UTF-8",
            ]) : null,
            'trust_server_certificate' => true
        ]]);

        $this->connection = DB::connection($connection);
        $this->connection->enableQueryLog();
        
        return $this->connection;
    }

    public function generateUniqueValueAsString()
    {
        $currentTime = now()->timestamp;
        $randnum1 = rand(0, 99999);
        $randnum2 = rand(0, 9999);

        $uniqueValue = $currentTime . $randnum1 . $randnum2;

        $uniqueValueString = strval($uniqueValue);

        return $uniqueValueString;
    }

    /**
     * @param int $type - The type of notification:
     *                    - 0 = Pending
     *                    - 1 = Accept
     *                    - 2 = Reject
     *                    - 3 = Null
     *                    - 9 = Image
     * 
     * @param int $parent - 01 = Reservasi
     *                    - 02 = Tabunagan
     *                    - 03 = Kredit
     *                    - 04 = Deposito
     *                    - 05 = TopUp
     *                    - 06 = Setoran
     *                    - 07 = Tagihan
     */
    public function sendNotification($title, $desctiption, $type, $user_id, $created_by, $parent = 0)
    {
        $notification = new NotificationModel();

        $notification->id = $this->generateUniqueValueAsString();
        $notification->title = $title;
        $notification->description = $desctiption;
        $notification->type = $type;
        $notification->user_id = $user_id;
        $notification->status = 0;
        $notification->created_at = now();
        $notification->created_by = $created_by;
        $notification->parent = $parent;

        $notification->save();
    }

    public function getPaymentMethodName($id)
    {   
        $user = Auth::user();

        $tenant = TenantsModel::where('id', $user->tenant_id)->first();
        $dsn = $tenant->core_database_dsn;

        $data = $this->sqlServerConnection($dsn)->table('aba')
        ->select('namabank')
        ->where('noaba', $id)
        ->first();
    
        return $data->namabank;
    }
    
    public function findOffice($tenant)
    {
        $tenant = TenantsModel::where('id', $tenant)->first();
        $dsn = $tenant->core_database_dsn;
        
        $data = $this->sqlServerConnection($dsn)->table('company_setup')
        ->select("sandicabang", "nama_bank", "alamat", "latitude", "longitude")
        ->get();
        
        return $data;
    }

    public function formatNumber($number)
    {
        return number_format($number, 0, ',', '.');
    }
}
