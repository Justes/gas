<?php

namespace App\Imports;

use App\Models\{BottleSaleLog, Station, Zone};
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithStartRow;

class SaleImport implements ToModel, WithStartRow
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

		$date = explode('-', $row[4]);
		if(empty($date[0])) {
			return null;
		}

		$year = $date[0];
		$month = $date[1];

        return new BottleSaleLog([
			'station_id' => $st->id,
			'company_id' => $st->company_id,
			'zone_id'	 => $zone->id ?? 0,
			'bottle_num' => $row[1],
			'volume'	 => $row[2],
			'sale_num'	 => $row[3],
			'sale_date'	 => $row[4],
			'sale_time'	 => $row[4],
			'year'		 => $year,
			'month'		 => $month
        ]);
    }
}
