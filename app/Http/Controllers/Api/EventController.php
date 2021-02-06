<?php

namespace App\Http\Controllers\Api;
use Illuminate\Http\Request;
use App\Models\{Event, EventType, AdminUser};

class EventController extends BaseController {

	public function index(Request $req) {
		$estatus = $req->event_status ?? 0;
		$events = Event::where(['event_status' => $estatus, 'admin_user_id' => $this->uid()])->paginate(20);
		$arr = [];
		foreach($events as $item) {
			$tmp = $item->toArray();
			unset($tmp['admin'], $tmp['type'], $tmp['station']);
			$arr[] = $tmp;
		}
		return err(0, $arr);
	}

	public function solve(Request $req) {
		$rules = $this->required($req, ['event_id']);
		if($rules) return err(4001, $rules);

		$now = time();
		$solveAt = $req->solved_at ?? $now;
		$event = Event::find($req->event_id);
		if(empty($event)) {
			return err(4000);
		}

		$mins = ceil(($solveAt - strtotime($event->created_at)) / 60);
		$event->solved_minutes = $mins;
		$event->solved_hours = round($mins / 60, 1);
		$event->event_status = 1;
		$event->solved_at = date("Y-m-d H:i:s", $solveAt);
		$event->solved_time = $solveAt;
		$event->deal_content = $req->deal_content;
		$event->save();
		return err();
	}
}
