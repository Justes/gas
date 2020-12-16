<?php

namespace App\Models;

class Zone extends BaseModel {

	protected $appends = ['zone_status_text'];

	public $statusArr = ['可用', '禁用'];

	public function stations() {
		return $this->hasMany('App\Models\Station');
	}

	public function setStationIdsAttribute($value) {
        $this->attributes['station_ids'] = implode(',', $value);
    }

	public function getStationIdsAttribute($value) {
        return array_filter(explode(',', $value));
    }

	public function getZoneStatusTextAttribute() {
		return $this->statusArr[$this->zone_status];
	}

	/*
	public function getStationsTextAttribute() {
		return $this->stations->implode('station_name', ',');
	}
	 */
}
