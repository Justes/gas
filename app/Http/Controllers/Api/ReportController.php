<?php

namespace App\Http\Controllers\Api;
use Illuminate\Http\Request;
use App\Models\{StationExam, StationExamStd, Standard};

class ReportController extends BaseController {

	public function fire(Request $req) {
		$rules = $this->required($req, ['station_id', 'year', 'quarter', 'fire_num', 'manage_file']);
		if($rules) return err(4001, $rules);

		$data = $req->all();
		$data['std_type'] = 5;
		$data['period'] = 2;
		$data['report_user_id'] = $this->uid();
		$data['report_time'] = date('Y-m-d H:i:s');
		$data['exam_date'] = date('Y-m-d');

		$exam = StationExam::create($data);
		$stds = Standard::where('std_type', 5)->get();
		$val['station_exam_id'] = $exam->id;
		foreach($stds as $std) {
			$val['standard_id'] = $std->id;
			$val['project'] = $std->project;
			$val['weight'] = $std->weight;
			$val['standard'] = $std->standard;
			StationExamStd::create($val);
		}

		return err();
	}

	public function secure(Request $req) {
		$rules = $this->required($req, ['station_id', 'year', 'quarter', 'sec_ck_num', 'sec_fix_num', 'manage_file']);
		if($rules) return err(4001, $rules);

		$data = $req->all();
		$data['std_type'] = 6;
		$data['period'] = 2;
		$data['report_user_id'] = $this->uid();
		$data['report_time'] = date('Y-m-d H:i:s');
		$data['exam_date'] = date('Y-m-d');

		$exam = StationExam::create($data);
		$stds = Standard::where('std_type', 6)->get();
		$val['station_exam_id'] = $exam->id;
		foreach($stds as $std) {
			$val['standard_id'] = $std->id;
			$val['project'] = $std->project;
			$val['weight'] = $std->weight;
			$val['standard'] = $std->standard;
			StationExamStd::create($val);
		}

		return err();
	}

	public function manage(Request $req) {
		$rules = $this->required($req, ['station_id', 'year', 'quarter', 'manage_file']);
		if($rules) return err(4001, $rules);

		$data = $req->all();
		$data['std_type'] = 7;
		$data['period'] = 2;
		$data['report_user_id'] = $this->uid();
		$data['report_time'] = date('Y-m-d H:i:s');
		$data['exam_date'] = date('Y-m-d');

		$exam = StationExam::create($data);
		$stds = Standard::where('std_type', 7)->get();
		$val['station_exam_id'] = $exam->id;
		foreach($stds as $std) {
			$val['standard_id'] = $std->id;
			$val['project'] = $std->project;
			$val['weight'] = $std->weight;
			$val['standard'] = $std->standard;
			StationExamStd::create($val);
		}

		return err();
	}

	public function logs(Request $req) {
		$rules = $this->required($req, ['station_id', 'std_type']);
		if($rules) return err(4001, $rules);

		$arr = [];
		if(in_array($req->std_type, [5, 6, 7])) {
			$exams = StationExam::where(['station_id' => $req->station_id, 'std_type' => $req->std_type])->orderBy('id', 'desc')->get();

			foreach($exams as $item) {
				$tmp = $item->toArray();
				unset($tmp['station'], $tmp['user']);
				$arr[] = $tmp;
			}
		}

		return err(0, $arr);
	}

}
