<?php

namespace App\Models;

class ExpireTip extends BaseModel {

	public function setStationIdsAttribute($value) {
        $this->attributes['station_ids'] = implode(',', $value);
    }

	public function getStationIdsAttribute($value) {
        return array_filter(explode(',', $value));
    }
}
