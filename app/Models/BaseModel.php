<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class BaseModel extends Model {
	protected $guarded = [];
	protected $hidden = ['deleted_at'];

	public $checkArr = ['未审核', '已审核'];

	public function columns() {
		return $this->getConnection()->getSchemaBuilder()->getColumnListing($this->getTable());
	}

	public function trims($field) {
		$cols = $this->columns();
		foreach($field as $key => $item) {
			if(!in_array($key, $cols)) {
				unset($field[$key]);
			}
		}
		return $field;
	}

	public function updateBy($id, $data) {
		return $this->where('id', $id)->update($data);
	}

	public function getCkStatusTextAttribute() {
		return isset($this->ck_status) ? $this->checkArr[$this->ck_status] : '';
	}

}
