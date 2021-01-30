<?php

namespace App\Imports;

use App\Models\{StationExam, Station, StationExamStd, Standard};
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithStartRow;

class EvalImport implements ToModel, WithStartRow
{
	public function startRow():int {
		return 2;
	}

    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    public function model(array $row)
    {
		$st = Station::where('station_name', $row[0])->first();
		if(empty($st)) {
			return null;
		}

		$date = explode('-', $row[4]);
		if(empty($date[0])) {
			return null;
		}

		$year = $date[0];
		$month = $date[1];

		$estatus = ['未审核', '已审核', '驳回'];
		$esIndex = 0;
		foreach($estatus as $key => $es) {
			if($es == $row[3]) {
				$esIndex = $key;
				break;
			}
		}

		$exam = StationExam::create([
			'station_id' => $st->id,
			'company_id' => $st->company_id,
			'year'		 => $row[1],
			'score'		 => $row[2],
			'exam_status' => $esIndex,
			'exam_date'	 => $row[4],
			'remark'	 => $row[5],
			'year'		 => $year,
			'std_type'	 => 9
        ]);

		if($exam->id) {
			$stds = Standard::where('std_type', 9)->get();
			foreach($stds as $std) {
				$data['station_exam_id'] = $exam->id;
				$data['project'] = $std->project;
				$data['weight'] = $std->weight;
				$data['standard'] = $std->standard;
				$data['standard_id'] = $std->id;
				StationExamStd::create($data);
			}
		}

        return null;
    }
}
