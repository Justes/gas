<?php

namespace App\Http\Controllers\Api;
use Illuminate\Http\Request;
use App\Http\Traits\ApiTrait;

class CallbackController extends BaseController {

	use ApiTrait;

	public function index(Request $req) {
		$data = $req->getContent();
		writeLog('callback', $data);

		$this->getAccessToken();

		return err();
	}
}
