<?php

namespace App\Models;

class AdminUser extends BaseModel {

	public $appends = ['avatar_url'];

	public function station() {
		return $this->belongsTo(Station::class);
	}

	public function getAvatarUrlAttribute() {
		if($this->avatar) {
			return \Storage::disk('admin')->url($this->avatar);
		}
	}

}
