<?php

namespace App\Http\Controllers\Api;
use Illuminate\Http\Request;
use App\Models\{Room, AdminUser, ImMsg};

class ImMsgController extends BaseController {

	public function index(Request $req) {
		$msg = $msgArr = [];
		$num = 20;
		if($req->room_id) {
			$msg = ImMsg::where(['type' => 1, 'chat_type' => 2, 'to' => $req->room_id])->paginate($num);
		}

		if($req->user_id) {
			$to = $req->user_id;
			$uid = $this->uid();

			$msg = ImMsg::where(['type' => 1, 'chat_type' => 1])
				->where(function($query) use ($uid, $to) {
					$query->where(['user_id' => $uid, 'to' => $to])
						->orWhere([['user_id', $to], ['to' , $uid]]);
				})
			->orderBy('id', 'desc')->paginate($num);
		}

		if($msg->count()) {
			$users = AdminUser::whereIn('id', $msg->pluck('user_id'))->get();
			$userArr = [];
			foreach($users as $item) {
				$userArr[$item->id] = $item;
			}

			foreach($msg as $item) {
				$tmp = $item->toArray();
				$user = $userArr[$item->user_id];
				$tmp['name'] = $user->sname;
				$tmp['avatar_url'] = $user->avatar_url;
				$msgArr[] = $tmp;
			}
		}


		return err(0, $msgArr);
	}
}
