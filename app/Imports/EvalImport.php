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

		$date = explode('-', $row[1]);
		if(empty($date[0])) {
			return null;
		}

		$year = $date[0];
		$month = $date[1];

		$qstatus = ['合格' => 0, '不合格' => 1];
		$pstatus = ['无问题' => 0, '有问题' => 1];
		$rstatus = ['合格' => 0, '不合格' => 1];

		$exam = StationExam::create([
			'station_id' => $st->id,
			'company_id' => $st->company_id,
			'exam_date'	 => $row[1],
			'permit_no'  => $row[2],
			'reg_no'	 => $row[3],
			'qualify'	 => $qstatus[$row[4]],
			'qualify_desc' => $row[5],
			'problem'	 => $pstatus[$row[6]],
			'problem_desc' => $row[7],
			'eval_result' => $rstatus[$row[8]],
			'score'		 => $row[9],
			'remark'	 => $row[10],
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
