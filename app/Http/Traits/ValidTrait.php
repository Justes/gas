<?php

namespace App\Http\Traits;
use Validator;

trait ValidTrait {

	public function rules($req, $valid) {
		$validator = Validator::make($req->all(), $valid);
		if($validator->fails()) {
			return $validator->errors()->all();
		}
		return false;
	}

	public function required($req, $valid) {
		$v = [];
		foreach($valid as $item) {
			$v[$item] = 'required';
		}
		return $this->rules($req, $v);
	}
}
