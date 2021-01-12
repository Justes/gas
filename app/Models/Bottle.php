<?php

namespace App\Models;

class Bottle extends BaseModel {

	protected $appends = ['status_text', 'station_name'];
	protected $statusArr = ['正常', '异常'];

	public function station() {
		return $this->belongsTo(Station::class);
	}

	public function getStatusTextAttribute() {
		return $this->statusArr[$this->status];
	}

	public function getStationNameAttribute() {
		return $this->station->station_name ?? '';
	}
}
