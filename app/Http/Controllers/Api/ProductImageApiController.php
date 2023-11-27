<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Api\BaseController;
use App\Models\ProductImageModel;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Auth;

class ProductImageApiController extends BaseController
{
    public function productImage(): JsonResponse
    {
        $user = Auth::user();

        $datas = ProductImageModel::where("tenant_id", $user->tenant_id)->get();

        $imageData = [];

        $url = 'http://192.168.8.143:8000/';

        foreach ($datas as $data) {
            $imageData[] = [
                'id' => $data->id,
                'title' => $data->title,
                'description' => $data->description,
                'imageUrl' => $data->name,
            ];
        }

        return $this->sendResponse($imageData, "Successfully find all images url");
    }
}
