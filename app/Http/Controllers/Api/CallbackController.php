<?php

namespace App\Http\Controllers\Api;

use App\Models\AdminUser;
use Illuminate\Http\Request;
use App\Http\Traits\ApiTrait;

class CallbackController extends BaseController {

	use ApiTrait;

	public function index(Request $req) {
		$data = $req->getContent();
		writeLog('callback', $data);

		$token = $this->getAccessToken(0);

		$auser = $this->getAdminUser($token);
		if(isset($auser['data'])) {
			$user = $auser['data'];
			$adminUser = AdminUser::where('user_id', $user['userId'])->first();
			if(empty($adminUser)) {
				$u['user_id'] = $user['userId'];
				$u['username'] = $user['userNo'];
				$u['name'] = $user['userName'];
				$u['extras'] = json_encode($u);
				AdminUser::create($u);
			}
		}

		return err();
	}
}
