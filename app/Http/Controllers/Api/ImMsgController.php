<?php

namespace App\Http\Controllers\Api;
use Illuminate\Http\Request;
use App\Models\{Room, AdminUser, ImMsg, RoomUser};
use Maatwebsite\Excel\Facades\Excel;

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

	public function export(Request $req) {
		$users = [];
		if($req->room_id) {
			$msg = ImMsg::where(['type' => 1, 'chat_type' => 2, 'to' => $req->room_id])->orderBy('id', 'asc')->get();
			$rUids = RoomUser::where('room_id', $req->room_id)->pluck('user_id')->toArray();
			$adminusers = AdminUser::whereIn('id', $rUids)->get();
			foreach($adminusers as $au) {
				$users[$au->id] = $au->sname ?? '';
			}

		} else if($req->user_id) {
			$to = $req->user_id;
			$uid = $this->uid();

			$msg = ImMsg::where(['type' => 1, 'chat_type' => 1])
				->where(function($query) use ($uid, $to) {
					$query->where(['user_id' => $uid, 'to' => $to])
						->orWhere([['user_id', $to], ['to' , $uid]]);
				})
			->orderBy('id', 'asc')->get();

			$to = AdminUser::find($req->user_id);
			$users[$req->user_id] = $to->sname ?? '';

			$user = AdminUser::find($uid);
			$users[$uid] = $user->sname ?? '';
		}

		Header( "Content-type:   application/octet-stream "); 
		Header( "Accept-Ranges:   bytes "); 
		header( "Content-Disposition:   attachment;   filename=聊天记录.txt"); 
		header( "Expires:   0 "); 
		header( "Cache-Control:   must-revalidate,   post-check=0,   pre-check=0 "); 
		header( "Pragma:   public "); 

		foreach($msg as $item) {
			if($item->msg_type == 2) {
				$item->msg = '[语音]';
			} else if($item->msg_type == 3) {
				$item->msg = '[图片]';
			} else if($item->msg_type == 4) {
				$item->msg = '[文件]' . $item->file_name;
			}

			if(isset($users[$item->user_id])) {
				echo $item->created_at .' '. $users[$item->user_id] .':'. $item->msg.PHP_EOL;
			}
		}
	}
}
