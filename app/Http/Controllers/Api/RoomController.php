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

	public function add(Request $req) {
		$rules = $this->required($req, ['room_id', 'user_ids']);
		if($rules) return err(4001, $rules);

		$uids = json_decode($req->user_ids, true);
		if(empty($uids)) {
			return err(4000);
		}

		$userIds = array_flip(array_flip($uids));

		foreach($userIds as $uid) {
			$data = ['room_id' => $req->room_id, 'user_id' => $uid];
			RoomUser::firstOrCreate($data, $data);
		}

		$cnt = RoomUser::where('room_id', $req->room_id)->count();
		Room::where('id', $req->room_id)->update(['user_cnt' => $cnt]);

		return err();
	}

	public function del(Request $req) {
		$rules = $this->required($req, ['room_id', 'user_ids']);
		if($rules) return err(4001, $rules);

		$ruser = RoomUser::where(['id' => $req->room_id, 'user_id' => $this->uid()])->first();
		if(empty($ruser->user_type)) {
			return err(4000);
		}

		$uids = json_decode($req->user_ids, true);
		if(empty($uids)) {
			return err(4000);
		}

		$userIds = array_flip(array_flip($uids));
		RoomUser::where('room_id', $req->room_id)->whereIn('user_id', $userIds)->delete();

		$cnt = RoomUser::where('room_id', $req->room_id)->count();
		Room::where('id', $req->room_id)->update(['user_cnt' => $cnt]);

		return err();
	}

	public function store(Request $req) {
		$rules = $this->required($req, ['user_ids']);
		if($rules) return err(4001, $rules);

		$uids = json_decode($req->user_ids, true);
		if(empty($uids)) {
			return err(4000);
		}

		$userIds = array_flip(array_flip($uids));

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

	public function update(Request $req) {
		$rules = $this->required($req, ['room_id']);
		if($rules) return err(4001, $rules);

		$v = $req->all();
		$roomModel = new Room;
		Room::where('id', $req->room_id)->update($roomModel->trims($v));
		return err();
	}

	public function uexit(Request $req) {
		$rules = $this->required($req, ['room_id']);
		if($rules) return err(4001, $rules);

		$ruser = RoomUser::where(['room_id' => $req->room_id, 'user_id' => $this->uid()])->first();
		if($ruser) {
			$utype = $ruser->user_type;
			$ruser->delete();

			if($utype) {
				$ru = RoomUser::where(['room_id' => $req->room_id])->first();
				if($ru) {
					$ru->user_type = 1;
					$ru->save();
				} else {
					Room::where('id', $req->room_id)->delete();
				}
			}

		}

		$cnt = RoomUser::where('room_id', $req->room_id)->count();
		Room::where('id', $req->room_id)->update(['user_cnt' => $cnt]);
		return err();
	}

}
