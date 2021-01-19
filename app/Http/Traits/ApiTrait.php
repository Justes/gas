<?php

namespace App\Http\Traits;
use App\Models\ApiSetting;

trait ApiTrait {
	
	public function getAccessToken() {
		$api = ApiSetting::first();
		$url = $api->url. '/oauth2/oauth/token';
		$token = $api->access_token;

		$params['client_id'] = $api->client_id;
		$params['client_secret'] = $api->client_secret;

		if(request('code') && (empty($api->access_token) || $api->create_token_time + $api->expires_in < time())) {
			$params['code'] = request('code');
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
			$token = $result['access_token'];
		}

		return $token;
	}

	public function getAdminUser($token) {
		$api = ApiSetting::first();
		$url = $api->url. '/oauth2/user/getUserInfo';
		$params['token'] = $token;

		$result = curl($url, $params);
		return $result;
	}
}
