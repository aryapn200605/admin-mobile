<?php

namespace App\Http\Controllers;

use App\Models\ProductImageModel;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cookie;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

class ProductImageController extends Controller
{

    public function generateUniqueValueAsString()
    {
        $currentTime = now()->timestamp;
        $randnum1 = rand(0, 99999);
        $randnum2 = rand(0, 9999);

        $uniqueValue = $currentTime . $randnum1 . $randnum2;

        $uniqueValueString = strval($uniqueValue);

        return $uniqueValueString;
    }

    public function index()
    {
        $date_now = date('Y-m-d H:i:s');
        $cookie = Cookie::get('userLogin');
        $decoded_cookie = json_decode($cookie);

        $datas = DB::table('image')
            ->select('image.*')
            ->join('tenants', 'image.tenant_id', '=', 'tenants.id')
            ->where('tenant_id', $decoded_cookie->tenant_id)
            ->get();

        foreach ($datas as &$data) {
            if ($date_now > $data->end_at) {
                $data->status = "non_active";
            } else if ($date_now < $data->end_at) {
                $data->status = "active";
            }
            $data->start_at = Carbon::parse($data->start_at)->isoFormat('DD MMMM YYYY, dddd HH:mm:ss', 'Do MMMM YYYY, dddd HH:mm:ss', 'id');
            $data->end_at = Carbon::parse($data->end_at)->isoFormat('DD MMMM YYYY, dddd HH:mm:ss', 'Do MMMM YYYY, dddd HH:mm:ss', 'id');
        }

        return view('admin.product-image.index', ['datas' => $datas]);
    }

    public function create()
    {
        return view('admin.product-image.create');
    }

    public function store(Request $request)
    {
        $cookie = Cookie::get('userLogin');
        $decoded_cookie = json_decode($cookie);

        $waktu_sekarang = time();
        $format_tanggal_waktu = "Y-m-d_His";

        $nama_file = 'images/' . date($format_tanggal_waktu, $waktu_sekarang) . '_' . str_replace(' ', '_', $decoded_cookie->tenant_name) . '.' . $request->file('name')->getClientOriginalExtension();

        $request->file('name')->move(public_path('images'), $nama_file);

        $product_image = new ProductImageModel();
        $product_image->id = $this->generateUniqueValueAsString();
        $product_image->title = $request->title;
        $product_image->description = $request->description;
        $product_image->name = $nama_file;
        $product_image->created_by = $decoded_cookie->user_id;
        $product_image->start_at = $request->start_at;
        $product_image->end_at = $request->end_at;
        $product_image->type = '1';
        $product_image->tenant_id = $decoded_cookie->tenant_id;
        $product_image->save();

        $title = $request->title;

        
        $url = 'http://192.168.18.100:8000/images/';
        $description = json_encode([
            'id' => $product_image->id,
            'title' => $product_image->title,
            'description' => $product_image->description,
            'imageUrl' => $url . str_replace('images/', '', $product_image->name),
        ]);

        $this->sendNotification($title, $description, 9, "0", $decoded_cookie->user_id);

        return redirect()->route('product-image')->with('success', 'Gambar berhasil disimpan.');
    }

    public function update(Request $request, $id)
    {
        // Update the product image's end_at attribute
        $image = ProductImageModel::find($id);

        if (!$image) {
            return response()->json(['status' => 'failed'], 404);
        }

        $image->end_at = $request->input('end_at');
        $image->save();

        return response()->json(['status' => 'success']);
    }
}
