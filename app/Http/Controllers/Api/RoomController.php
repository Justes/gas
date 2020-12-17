<?php

namespace App\Http\Controllers\Api;
use Illuminate\Http\Request;
use App\Models\{Room, RoomUser, AdminUser};

class RoomController extends BaseController {

	public function index(Request $req) {
		$rules = $this->required($req, ['room_id']);
		if($rules) return err(4001, $rules);

		$rusers = RoomUser::where('room_id', $req->room_id)->orderBy('id', 'asc')->get();
		$users = [];
		foreach($rusers as $ru) {
			$user = AdminUser::find($ru->user_id);
			if($user) {
				$stationName = $user->station->station_name ?? '';
				$tmp['user_id'] = $user->id;
				$tmp['name'] = $stationName .'('.$user->name.')';
				$tmp['avatar'] = $user->avatar ?? '';
				$tmp['user_type'] = $ru->user_type;

				$users[] = $tmp;
			}
		}

		return err(0, $users);
	}

	public function store(Request $req) {
		$rules = $this->required($req, ['user_ids']);
		if($rules) return err(4001, $rules);

		$userIds[] = $this->uid();
		$uids = json_decode($req->user_ids, true);
		if(empty($uids)) {
			return err(4000);
		}

		$userIds = array_merge($userIds, $uids);

		$room = Room::create(['user_cnt' => count($userIds)]);
		$room->room_name = '聊天群'.$room->id;
		$room->save();

		foreach($userIds as $uid) {
			$utype = 0;
			if($uid == $this->uid()) {
				$utype = 1;
			}
			RoomUser::create(['room_id' => $room->id, 'user_id' => $uid, 'user_type' => $utype]);
		}
		
		$arr = $room->toArray();
		$arr['room_id'] = $room->id;

		return err(0, $arr);
	}
}
