<?php

namespace App\Http\Controllers\Api;
use Illuminate\Http\Request;
use App\Models\ApiSetting;

class CallbackController extends BaseController {

	public function index(Request $req) {
		$data = $req->getContent();
		writeLog('callback', $data);

		$api = ApiSetting::first();
		$url = $api->url. '/oauth/token';

		$params['client_id'] = $api->client_id;
		$params['client_secret'] = $api->client_secret;

		if(empty($api->access_token) || $api->create_token_time + $api->expires_in < time()) {
			$params['code'] = $req->code;
			$params['grant_type'] = 'authorization_code';
			$result = curl($url, $params);
		} else if($api->create_token_time + $api->expires_in - 600 < time()) {
			$params['grant_type'] = 'refresh_token';
			$params['refresh_token'] = $api->refresh_token;
			$result = curl($url, $params);
		}

		if(isset($result['access_token'])) {
			$set = new ApiSetting;
			$result['create_token_time'] = time();
			ApiSetting::where('id', 1)->update($set->trims($result));
		}

		return err();
	}
}
