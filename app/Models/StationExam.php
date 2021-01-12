<?php

namespace App\Models;

class StationExam extends BaseModel {

	protected $appends = ['station_name', 'company_name', 'period_text', 'exam_status_text', 'user_name', 'quarter_text', 'status_text'];

	protected $periods = ['周度', '月度', '季度', '年度'];
	protected $exams = ['未考核', '已考核'];
	protected $status = ['未审核', '已审核', '驳回'];
	protected $quarters = ['', '第一季度', '第二季度', '第三季度', '第四季度'];

	public function station() {
		return $this->belongsTo(Station::class);
	}

	public function user() {
		return $this->hasOne(AdminUser::class, 'id', 'report_user_id');
	}

	public function getStationNameAttribute() {
		return $this->station->station_name ?? '';
	}

	public function getCompanyNameAttribute() {
		return $this->station->company->company_name ?? '';
	}

	public function getPeriodTextAttribute() {
		return $this->periods[$this->period] ?? '';
	}

	public function getExamStatusTextAttribute() {
		return $this->exams[$this->exam_status] ?? '';
	}

	public function getUserNameAttribute() {
		return $this->user->name ?? '';
	}

	public function getQuarterTextAttribute() {
		return $this->quarters[$this->quarter];
	}

	public function getStatusTextAttribute() {
		return $this->status[$this->exam_status];
	}
}
