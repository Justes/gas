<?php

namespace App\Models;

class Event extends BaseModel {

	protected $appends = ['event_type_text', 'event_status_text', 'station_name', 'admin_user_name', 'solve_time_text'];
	public $eventArr = ['未解决', '已解决'];

	public function type() {
		return $this->hasOne(EventType::class, 'id', 'event_type_id');
	}

	public function station() {
		return $this->belongsTo(Station::class);
	}

	public function admin() {
		return $this->hasOne(AdminUser::class, 'id', 'admin_user_id');
	}

	public function getEventTypeTextAttribute() {
		return $this->type->etype_name ?? '';
	}

	public function getEventStatusTextAttribute() {
		return $this->eventArr[$this->event_status];
	}

	public function getStationNameAttribute() {
		return $this->station->station_name ?? '';
	}

	public function getAdminUserNameAttribute() {
		return $this->admin->name ?? '';
	}

	public function getSolveTimeTextAttribute() {
		$begin = strtotime($this->created_at);
		$end = $this->solved_time ?? time();
		$time = $end - $begin;
		return changeTime($time);
	}

	public function scopeStn($query) {
		if(request('station_id')) {
			return $query->where('station_id', request('station_id'));
		}
		return $query;
	}

}
