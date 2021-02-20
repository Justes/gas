<?php

namespace App\Http\Controllers\Api;
use Illuminate\Http\Request;
use App\Models\{Room, AdminUser, ImMsg};

class ImMsgController extends BaseController {

	public function index(Request $req) {
		$msgArr = [];
		$msg = collect();
		$num = 30;

		if($req->search_msg) {
			$searchMsg = $req->search_msg;
		}

		if($req->room_id) {
			if($req->search_msg) {
				$msg = ImMsg::where(['type' => 1, 'chat_type' => 2, 'to' => $req->room_id])->where(function($query) use ($searchMsg) {
					$query->where('msg', 'like', "%{$searchMsg}%")
						->orWhere('file_name', 'like', "%{$searchMsg}%");
				})->orderBy('id', 'desc')->paginate($num);
			} else {
				$msg = ImMsg::where(['type' => 1, 'chat_type' => 2, 'to' => $req->room_id])->orderBy('id', 'desc')->paginate($num);
			}
		}

		if($req->user_id) {
			$to = $req->user_id;
			$uid = $this->uid();

			if($req->search_msg) {
				$msg = ImMsg::where(['type' => 1, 'chat_type' => 1])
					->where(function($query) use ($uid, $to) {
						$query->where(['user_id' => $uid, 'to' => $to])
							->orWhere([['user_id', $to], ['to' , $uid]]);
					})->where(function($query) use ($searchMsg) {
						$query->where('msg', 'like', "%{$searchMsg}%")
							->orWhere('file_name', 'like', "%{$searchMsg}%");
					})
				->orderBy('id', 'desc')->paginate($num);
			} else {
				$msg = ImMsg::where(['type' => 1, 'chat_type' => 1])
					->where(function($query) use ($uid, $to) {
						$query->where(['user_id' => $uid, 'to' => $to])
							->orWhere([['user_id', $to], ['to' , $uid]]);
					})
				->orderBy('id', 'desc')->paginate($num);
			}
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
				$tmp['avatar'] = $user->avatar_url;
				$tmp['oid'] = $item->to;
				if($item->chat_type == 1) {
					if($item->to == $uid) {
						$tmp['oid'] = $item->user_id;
					}
				}
				$msgArr[] = $tmp;
			}
		}

		return err(0, $msgArr);
	}

	public function files(Request $req) {
		$uid = $this->uid();

		if($req->file_name) {
			$msgs = ImMsg::where(['chat_type' => 1, 'msg_type' => 4])->where(function($query) use ($uid) {
					$query->where(['user_id' => $uid])
						->orWhere([['to' , $uid]]);
				})->where('file_name', 'like', "%{$req->file_name}%")->orderBy('id', 'desc')->paginate();
		} else {
			$msgs = ImMsg::where(['chat_type' => 1, 'msg_type' => 4])->where(function($query) use ($uid) {
					$query->where(['user_id' => $uid])
						->orWhere([['to' , $uid]]);
				})->orderBy('id', 'desc')->paginate();
		}
		$arr = [];
		foreach($msgs as $msg) {
			$tmp = $msg->toArray();
			$user = AdminUser::find($msg->user_id);
			$tmp['name'] = $user->sname;
			$tmp['avatar'] = $user->avatar_url;
			$arr[] = $tmp;
		}
		return err(0, $arr);
	}
}
