<?php

namespace App\Models;

class Company extends BaseModel {

	protected $appends = ['company_type_text', 'ck_status_text'];

	public $ctypes = ['私企', '国企'];

	public function getCompanyTypeTextAttribute() {
		return $this->ctypes[$this->company_type] ?? '';
	}
}
