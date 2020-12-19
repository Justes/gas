<?php

namespace App\Models;

class AdminUser extends BaseModel {

	public $appends = ['avatar_url', 'sname'];

	public function station() {
		return $this->belongsTo(Station::class);
	}

	public function getAvatarUrlAttribute() {
		if($this->avatar) {
			if(strpos($this->avatar, 'http') === false) {
				return \Storage::disk('admin')->url($this->avatar);
			}
		}
		return $this->avatar;
	}

	public function getSnameAttribute() {
		$stationName = $this->station->station_name ?? '';
		return $stationName . '(' . $this->name . ')';
	}

}
