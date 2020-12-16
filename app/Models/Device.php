<?php

namespace App\Models;

class Device extends BaseModel {

	protected $appends = ['station_name', 'admin_user_name', 'device_status_text'];

	public $statusArr = ['正常', '维修中', '报废'];

	public function station() {
		return $this->hasOne('App\Models\Station', 'id', 'station_id');
	}

	public function user() {
		return $this->hasOne('App\Models\AdminUser', 'id', 'admin_user_id');
	}

	public function getStationNameAttribute() {
		return $this->station->station_name ?? '';
	}

	public function getAdminUserNameAttribute() {
		return $this->user->name ?? '';
	}

	public function getDeviceStatusTextAttribute() {
		return $this->statusArr[$this->device_status];
	}

}
