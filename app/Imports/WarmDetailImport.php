<?php

namespace App\Imports;

use App\Models\{WarmSaleDetail, Station, BonusConfig, Zone};
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithStartRow;

class WarmDetailImport implements ToModel, WithStartRow
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

		$config = BonusConfig::first();
		if(empty($config)) {
			return null;
		}

		$day = ceil((strtotime($row[11] .' 00:00:00') - strtotime($row[9]. ' 00:00:00')) / 86400);
		$used = number_format(($row[10] - $row[8]) - $config->warm_eve * $day), 2, '.', '');
		if($used >= $config->warm_limit) {
			$bonus = $config->warm_limit * $config->warm_bonus;
		} else {
			$bonus = $used * $config->warm_bonus;
		}

		$bonus = number_format($bonus, 2, '.', '');

		$bonusWarm = ($used > 820) ? 820 : $used;

        return new WarmSaleDetail([
			'station_id' => $st->id ?? 0,
			'company_id' => $st->company_id ?? 0,
			'zone_id'	 => $zone->id ?? 0,
			'reporter'   => $row[1],
			'report_time' => $row[2],
			'year'		 => $row[3],
			'time_range' => $row[4],
			'days'  => $day,
			'zones'		 => $row[5],
			'no' => $row[6],
			'username'	 => $row[7],
			'first_num'	 => $row[8],
			'first_date' => $row[9],
			'second_num' => $row[10],
			'second_date' => $row[11],
			'gas_no' => $row[12],
			'used_warm' => $used,
			'bonus_warm' => $bonusWarm,
			'return_warm' => number_format($bonus / $config->warm_price, 2, '.', ''),
			'bonus' => $bonus,
			'remark'	 => $row[13]
        ]);
    }
}
