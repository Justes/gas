<?php

namespace App\Models;

class GasStat extends BaseModel {

	protected $appends = ['company_name'];

	public function company() {
		return $this->hasOne('App\Models\Company', 'id', 'company_id');
	}

	public function getCompanyNameAttribute() {
		return $this->company->company_name ?? '';
	}

}
