<?php

namespace App\Imports;

use App\Models\{BottleSaleDetail, Station, BonusConfig, Zone};
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithStartRow;

class BottleDetailImport implements ToModel, WithStartRow
{
	public function startRow():int {
		return 1;
	}

    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    public function model(array $row)
    {
		$st = Station::where('station_name', $row[0])->first();
		if($st) {
			$zones = Zone::where('station_ids', 'like', "%{$st->id}%")->get();
			foreach($zones as $item) {
				if(in_array($st->id, $item->station_ids)) {
					$zone = $item;
					break;
				}
			}
		} else {
			return null;
		}

		$num = intval($row[7] + $row[8]);

		$config = BonusConfig::first();
		if(empty($config)) {
			return null;
		}

		$bonus = $row[7] * $config->discount_bonus + $row[8] * $config->fair_bonus;

        return new BottleSaleDetail([
			'station_id' => $st->id ?? 0,
			'company_id' => $st->company_id ?? 0,
			'zone_id'	 => $zone->id ?? 0,
			'reporter'   => $row[1],
			'report_time' => $row[2],
			'year'		 => $row[3],
            'quarter'    => intval($row[4]),
			'time_range' => $row[5],
			'zones'		 => $row[6],
			'discount_num' => $row[7],
			'fair_num'	 => $row[8],
			'sale_num'	 => $num,
			'bonus'		 => $bonus,
			'remark'	 => $row[10]
        ]);
    }
}
