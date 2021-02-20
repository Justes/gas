<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Traits\ValidTrait;
use App\Models\{AdminUser};

class BaseController extends Controller {
	use ValidTrait;

	public function uid() {
		$user = $this->user();
		return $user->id;
	}

	public function user() {
		$token = request()->header('token');
		if(empty($token)) {
			$token = request('token');
		}
		$user = AdminUser::where('token', $token)->first();
		return $user;
	}
}
