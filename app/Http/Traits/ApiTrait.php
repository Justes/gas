<?php

namespace App\Http\Traits;
use App\Models\{ApiSetting, AdminUser};

trait ApiTrait {
	
	public function getAccessToken($plt=1) {
		$api = ApiSetting::first();
		$url = $api->url. '/oauth2/oauth/token';
		$pltToken = $api->access_token;

		$params['client_id'] = $api->client_id;
		$params['client_secret'] = $api->client_secret;

		if(request('code')) {
			$params['code'] = request('code');
			$params['grant_type'] = 'authorization_code';
			$result = curl($url, $params);
			$token = $result['access_token'];
		}

		if((empty($api->access_token) || $api->create_token_time + $api->expires_in < time())) {
			$params['grant_type'] = 'client_credentials';
			$result = curl($url, $params);
			if(isset($result['access_token'])) {
				$set = new ApiSetting;
				$result['create_token_time'] = time();
				ApiSetting::where('id', 1)->update($set->trims($result));
				$pltToken = $result['access_token'];

			}
			/*
		} else if($api->create_token_time + $api->expires_in - 600 < time()) {
			$params['grant_type'] = 'refresh_token';
			$params['refresh_token'] = $api->refresh_token;
			$result = curl($url, $params);
			 */
		}

		if($plt) {
			return $pltToken;
		} else {
			return $token;
		}

	}

	public function getAdminUser($token) {
		$api = ApiSetting::first();
		$url = $api->url. '/oauth2/user/getUserInfo';
		$params['token'] = $token;

		$result = curl($url, $params);

		if(isset($result['data'])) {
			$user = $result['data'];
			$adminUser = AdminUser::where('user_id', $user['userId'])->first();
			if(empty($adminUser)) {
				$u['type'] = 1;
				$u['user_id'] = $user['userId'];
				$u['username'] = $user['userNo'];
				$u['name'] = $user['userName'];
				$u['extras'] = json_encode($u);
				$u['token'] = $token;
				AdminUser::create($u);
			} else {
				$adminUser->token = $token;
				$adminUser->save();
			}
		}
		return $result;
	}
}
