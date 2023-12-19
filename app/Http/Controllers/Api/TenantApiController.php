<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\API\BaseController as BaseController;
use App\Models\TenantsModel;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Auth;

class TenantApiController extends BaseController
{
    public function findAllTenants(): JsonResponse
    {
        $products = TenantsModel::all();

        return $this->sendResponse($products, 'Products retrieved successfully.');
    }

    public function findTenantById(String $id): JsonResponse
    {
        $data = TenantsModel::where('public_id', $id)->first();

        return $this->sendResponse($data, "success get all data");
    }


    /**
     * @param $type = 1 -> simpanan
     *                2 -> pinjaman
     * 
     * 
     */
    public function findPaymentMethod($type, String $id): JsonResponse
    {
        $user = Auth::user();

        $tenant = TenantsModel::where('id', $user->tenant_id)->first();
        $dsn = $tenant->core_database_dsn;

        if ($type == "1") {
            $sandicabang = $this->sqlServerConnection($dsn)->table('tabmaster')
                ->select('sandicabang')
                ->where('norekening', $id)
                ->first();
        } else if ($type == "2") {
            $sandicabang = $this->sqlServerConnection($dsn)->table('crdmaster')
                ->select('sandicabang')
                ->where('norekcrd', $id)
                ->first();
        }

        $datas = $this->sqlServerConnection($dsn)->table('aba')
            ->select('noaba', 'namabank', 'norek', 'namaaba')
            ->where('sandicabang', $sandicabang->sandicabang)
            ->where(function ($query) {
                $query->where('jenispenempatan', '20')
                    ->orWhere('jenispenempatan', '10');
            })
            ->get();

        $modifiedData = [];
        foreach ($datas as $item) {
            if ($item->norek != "" || $item->norek != null) {
                $modifiedData[] = [
                    'id' => $item->noaba,
                    'title' => ucwords(strtolower($item->namaaba . ' - ' . $item->namabank)),
                    'description' => $item->norek,
                ];
            }
        }

        // $cash = [
        //     "id" => "10010000101110",
        //     "title" => "Tunai - Cash",
        //     "description" => ""
        // ];

        // array_push($modifiedData, $cash);

        return $this->sendResponse($modifiedData, 'Sukses mengambil payment method');
    }

    public function topupReason() : JsonResponse
    {
        $data = [
            "Pembelian Barang Konsumtif",
            "Pendidikan",
            "Properti",
            "Kendaraan",
            "Renovasi Rumah",
            "Modal Usaha",
            "Krisis Keuangan Mendesak",
            "Konsolidasi Utang",
            "Pengeluaran Tak Terduga",
            "Investasi",
            "Kesehatan dan Biaya Medis",
            "Liburan dan Rekreasi",
            "Pernikahan",
            "Pembiayaan Perjalanan",
            "Pembiayaan Kegiatan Hiburan",
            "Pemenuhan Kebutuhan Sehari-hari",
            "Biaya Pindah atau Relokasi",
            "Pembiayaan Teknologi dan Gadget",
            "Biaya Hobi atau Koleksi",
            "Pembiayaan Acara Khusus",
            "Perbaikan Darurat Rumah Tangga",
            "Biaya Pekerjaan atau Pelatihan",
            "Pembiayaan Kesejahteraan Hewan Peliharaan",
            "Pembelian Barang Mewah",
            "Biaya Adopsi atau Fertilisasi In Vitro",
            "Pembayaran Pajak atau Hutang Fiskal",
            "Pembayaran Asuransi",
            "Pembiayaan Dana Darurat",
            "Pembiayaan Proyek Seni atau Kreatif",
            "Pembelian Saham atau Investasi Keuangan",
            "Lainnya..."
        ];

        $result = collect($data)->map(function ($alasan) {
            return [
                'value' => $alasan,
                'label' => $alasan,
            ];
        });

        return $this->sendResponse($result, "sukses");
    }
}
