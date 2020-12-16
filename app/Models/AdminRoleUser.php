<?php

namespace App\Models;

class AdminRoleUser extends BaseModel {

	public function role() {
		return $this->belongsTo(AdminRole::class);
	}

}
