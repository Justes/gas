<?php

namespace App\Http\Controllers\Api;
use Illuminate\Http\Request;
use App\Models\{AdminUser, AdminRoleUser, AdminRole, Room, RoomUser};

class UserController extends BaseController {

	public function login(Request $req) {
		$rules = $this->required($req, ['username', 'password']);
		if($rules) return err(4001, $rules);

		$password = base64_decode($req->password);
		$user = AdminUser::where('username', $req->username)->first();

		if($user && \Hash::check($password, $user->password)) {
			if($user->status) {
				return err(4113);
			}

			$info['name'] = $user->name;
			$info['avatar'] = $user->avatar ?? '';
			$info['company_name'] = $user->station->company->company_name;
			$info['station_name'] = $user->station->station_name;
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
		$arr = [];
		foreach($users as $user) {
			$tmp['user_id'] = $user->id;
			$tmp['name'] = $user->station->station_name . '('.$user->name.')';
			$tmp['avatar'] = $user->avatar ?? '';
			$arr[] = $tmp;
		}

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

	public function info(Request $req) {
		$userId = $req->user_id ?? $this->uid();
		$user = AdminUser::find($userId);
		if($user) {
			$arr['avatar'] = $user->avatar;
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
}
