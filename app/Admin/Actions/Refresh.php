<?php

namespace App\Admin\Actions;

use Encore\Admin\Actions\Action;
use Illuminate\Http\Request;
use App\Models\{ApiSetting, AdminUser, IntfcLog};
use App\Http\Traits\ApiTrait;

class Refresh extends Action
{
	use ApiTrait;

    protected $selector = '.refresh';

    public function handle(Request $request)
    {
        // $request ...

		$api = ApiSetting::first();
		$url = $api->url. $api->user_uri;

		$params['access_token'] = $this->getAccessToken();
		$params['projectId'] = $api->project_id;

		$result = curl($url, $params);
		if(isset($result['success'])) {
			$users = $result['data'] ?? [];
			foreach($users as $user) {
				$adminUser = AdminUser::where('user_id', $user['userId'])->first();
				if(empty($adminUser)) {
					$u['type'] = 1;
					$u['user_id'] = $user['userId'];
					$u['username'] = $user['userNo'];
				   	$u['name'] = $user['userName'];
					$u['extras'] = json_encode($u);
					AdminUser::create($u);
				}
			}

		}

		$data['name'] = '用户列表';
		$data['uri'] = $url;
		IntfcLog::create($data);

        return $this->response()->success('成功')->refresh();
    }

    public function html()
    {
        return <<<HTML
        <a class="btn btn-sm btn-info refresh">刷新</a>
HTML;
    }
}
