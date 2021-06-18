<?php

namespace App\Http\Controllers;

use App\AdminUser;
use Illuminate\Http\Request;
use App\Http\Traits\ApiTrait;
use Encore\Admin\Facades\Admin;

class CallbackController extends Controller {

	use ApiTrait;

	public function index(Request $req) {
		$data = $req->getContent();
		writeLog('callback', $data);

		$token = $this->getAccessToken(0);
		$auser = $this->getAdminUser($token);
		if(isset($auser['data'])) {
			$user = $auser['data'];
			$user = AdminUser::where('user_id', $user['userId'])->first();
			Admin::guard()->login($user);
		}
		return redirect('admin');
	}
}
