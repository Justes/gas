<?php

namespace App\Models;

class BottleSaleLog extends BaseModel {

	protected $appends = ['station_name', 'company_name'];

	public function station() {
		return $this->belongsTo(Station::class);
	}

	public function getStationNameAttribute() {
		return $this->station->station_name ?? '';
	}

	public function getCompanyNameAttribute() {
		return $this->station->company->company_name ?? '';
	}
}
