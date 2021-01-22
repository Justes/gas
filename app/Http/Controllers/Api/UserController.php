<?php

namespace App\Http\Controllers\Api;
use Illuminate\Http\Request;
use App\Models\{AdminUser, AdminRoleUser, AdminRole, Room, RoomUser, Chat};
use App\Http\Traits\ApiTrait;

class UserController extends BaseController {

	use ApiTrait;

	public function login(Request $req) {
		$rules = $this->required($req, ['username', 'password']);
		if($rules) return err(4001, $rules);

		$password = base64_decode($req->password);
		$user = AdminUser::where('username', $req->username)->first();

		if($user && \Hash::check($password, $user->password)) {
			if($user->status) {
				return err(4113);
			}

			$info['user_id'] = $user->id;
			$info['name'] = $user->name;
			$info['avatar'] = $user->avatar_url ?? '';
			$info['company_name'] = $user->station->company->company_name ?? '';
			$info['station_id'] = $user->station_id;
			$info['station_name'] = $user->station->station_name ?? '';
			$roleUser = AdminRoleUser::where('user_id', $user->id)->first();
			$info['role_name'] = $roleUser->role->name ?? '';
			$info['mobile'] = $user->mobile;
			$info['token'] = $user->token = md5($user->username . $user->id);
			$user->save();
			return err(0, $info);
		} else {
			return err(4101);
		}
	}

	public function check(Request $req) {
		$rules = $this->required($req, ['username']);
		if($rules) return err(4001, $rules);

		$exist = 0;
		$user = AdminUser::where('username', $req->username)->first();
		if($user) {
			$exist = 1;
		}
		return err(0, compact('exist'));
	}

	public function reset(Request $req) {
		$rules = $this->required($req, ['old', 'password', 'repassword']);
		if($rules) return err(4001, $rules);

		if($req->password != $req->repassword) {
			return err(4102);
		}

		$old = base64_decode($req->old);
		$password = base64_decode($req->password);

		$user = $this->user();
		if($user && \Hash::check($old, $user->password)) {
			$user->password = bcrypt($password);
			$user->save();
			return err();
		} else {
			return err(4105);
		}
	}

	public function contacters() {
		$users = AdminUser::where('status', 0)->get();
		$arr = $unknown = [];
		foreach($users as $user) {
			if($this->uid() == $user->id) {
				continue;
			}

			$tmp['user_id'] = $user->id;
			$tmp['name'] = $user->sname;
			$tmp['avatar'] = $user->avatar_url;
			$ch = getfirstchar($tmp['name']);
			if($ch) {
				$arr[$ch][] = $tmp;
			} else {
				$unknown['#'][] = $tmp;
			}
		}
		$arr = array_merge($arr, $unknown);
		ksort($arr);

		$roomIds = RoomUser::where('user_id', $this->uid())->groupBy('room_id')->pluck('room_id')->toArray();
		$list['rooms'] = Room::whereIn('id', $roomIds)->get(['id as room_id', 'room_name', 'room_pic', 'user_cnt']);
		$list['users'] = $arr;

		return err(0, $list);
	}

	public function update(Request $req) {
		$editable = ['avatar', 'name', 'mobile'];
		$data = $req->all();

		$user = $this->user();

		foreach($data as $key => $item) {
			if(in_array($key, $editable)) {
				$user->$key = $item;
			}
		}

		$user->save();
		return err();
	}

	public function detail(Request $req) {
		$auser = $this->getAdminUser($req->header('token'));
		$user = '';
		if(isset($auser['data'])) {
			$user = $auser['data'];
			$user = AdminUser::where('user_id', $user['userId'])->first();
		}

		if($user) {
			$arr['user_id'] = $user->id;
			$arr['avatar'] = $user->avatar_url;
			$arr['name'] = $user->name;
			$arr['mobile'] = $user->mobile;
			$arr['station_name'] = $user->station->station_name ?? '';
			$arr['company_name'] = $user->station->company->company_name ?? '';
			$roleUser =	AdminRoleUser::where('user_id', $user->id)->first();
			$arr['role_name'] = $roleUser->role->name ?? '';
			return err(0, $arr);
		} else {
			return err(4000);
		}
	}

	public function info(Request $req) {
		$this->getAdminUser($req->token);

		$userId = $req->user_id ?? $this->uid();
		$user = AdminUser::find($userId);
		if($user) {
			$arr['user_id'] = $user->id;
			$arr['avatar'] = $user->avatar_url;
			$arr['name'] = $user->name;
			$arr['mobile'] = $user->mobile;
			$arr['station_name'] = $user->station->station_name ?? '';
			$arr['company_name'] = $user->station->company->company_name ?? '';
			$roleUser =	AdminRoleUser::where('user_id', $user->id)->first();
			$arr['role_name'] = $roleUser->role->name ?? '';
			return err(0, $arr);
		} else {
			return err(4000);
		}
	}

	public function upload(Request $req) {
		$file = $req->file('file');
		$name = $file->getClientOriginalName();
		$rand = '_'.mt_rand(1000, 9999);
		$ext = '';
		if(strpos($name, '.')) {
			$arr = explode('.', $name);
			$ext = end($arr);
			$name = $arr[0];
		}
		$name .= $rand.'.'.$ext;

		$path = \Storage::disk('admin')->putFileAs('files', $file, $name);
		$data['file_url'] = \Storage::disk('admin')->url($path);
		$data['file_name'] = $name;
		$data['file_ext'] = $ext;
		return err(0, $data);
	}

	public function chat() {
		$roomIds = RoomUser::where('user_id', $this->uid())->groupBy('room_id')->pluck('room_id');
		$chats = Chat::where(['chat_type' => 1, 'user_id' => $this->uid()])->orWhere(function($query) use ($roomIds) {
			$query->where('chat_type', 2)->whereIn('to', $roomIds);
		})->orderBy('updated_at', 'desc')->get();

		$arr = [];

		foreach($chats as $item) {
			if($item->chat_type == 2) {
				$room = Room::find($item->to);
				$user = AdminUser::find($item->user_id);
				$item->msg = $item->name . ':' . $item->msg;
				$item->name = $room->room_name ?? '';
				$item->avatar = $room->room_pic ?? '';
			} else {
				$user = AdminUser::find($item->to);
				$item->name = $user->sname ?? '';
				$item->avatar = $user->avatar_url ?? '';
			}

			$tmp = $item->toArray();
			$tmp['oid'] = $item->to;
			if($item->chat_type == 1) {
				if($item->to == $this->uid()) {
					$tmp['oid'] = $item->user_id;
				}
			}

			$arr[] = $tmp;
		}
		return err(0, $arr);
	}

	public function chatDel(Request $req) {
		$rules = $this->required($req, ['id']);
		if($rules) return err(4001, $rules);

		Chat::destroy($req->id);
		return err();
	}
}
