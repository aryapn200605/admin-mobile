<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Api\BaseController;
use App\Models\NotificationModel;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class NotificationApiController extends BaseController
{
    public function findAllNotification(): JsonResponse
    {
        $user = Auth::user();

        $notifications = NotificationModel::whereIn('user_id', [0, $user->id])
            ->orderBy('created_at', 'desc')
            ->get();

        $transformedNotifications = $this->transformNotifications($notifications);

        return $this->sendResponse(json_encode($transformedNotifications), "Sukses mengambil notifikasi");
    }

    private function transformNotifications($notifications)
    {
        return $notifications->map(function ($notification) {
            return [
                'id' => json_encode($notification->id),
                'title' => $notification->title,
                'description' => $notification->description,
                'type' => $notification->type,
                'user_id' => $notification->user_id,
                'status' => $notification->status,
                'created_at' => $notification->created_at,
                'created_by' => $notification->created_by,
                'parent' => substr($notification->parent,0,2),
            ];
        });
    }


    public function notificationStatus(String $id): JsonResponse
    {
        $notif = NotificationModel::where('id', $id)->first();

        if ($notif->status == 0) {
            $notif->status = 1;
            $notif->save();
            return $this->sendResponse("", "berhasil mengubah status");
        } else {
            return $this->sendResponse("", "status telah berubah");
        }
    }
}
