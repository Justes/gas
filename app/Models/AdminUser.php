<?php

namespace App\Models;

class AdminUser extends BaseModel {

	public function station() {
		return $this->belongsTo(Station::class);
	}

}
