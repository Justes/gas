<?php

namespace App\Models;

class Station extends BaseModel {

	protected $appends = ['ck_status_text', 'company_name', 'type_text', 'permit_text'];
	public $typeArr = ['换瓶站', 'LNG气站', 'CNG气站'];
	public $permitArr = ['无', '有'];

	public function company() {
		return $this->hasOne('App\Models\Company', 'id', 'company_id');
	}

	public function backup() {
		return $this->hasOne('App\Models\Company', 'id', 'backup_company_id');
	}

	public function devices() {
		return $this->hasMany('App\Models\Device');
	}

	public function zone() {
         return $this->belongsTo('App\Models\Zone');
    }

	public function getCompanyNameAttribute() {
		return $this->company->company_name ?? '';
	}

	public function getTypeTextAttribute() {
		return $this->typeArr[$this->type];
	}

	public function getPermitTextAttribute() {
		return $this->permitArr[$this->permit];
	}
}
