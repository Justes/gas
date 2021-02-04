<?php

namespace App\Http\Controllers\Api;
use App\Models\{Article, ExpireTip, Station};

class IndexController extends BaseController {

	public function index() {
		/*
		$this->sendMsg();
		$arts = Article::where(['effect_status' => 0, 'send_type' => 1, 'post_status' => 1])->get();
		$now = time();
		foreach($arts as $item) {
			if($now > strtotime($item->send_time)) {
				$item->post_status = 0;
				$item->save();
				echo 'post '. $item->id . '<br>';
			}
		}
		 */
	}

	protected function sendMsg() {
		$now = date('Y-m-d H:i');
		$tips = ExpireTip::where('trigger_time', 'like', $now.'%')->get();
		foreach($tips as $item) {
			$userIds = [];
			$sts = Station::whereIn('id', $item->station_ids)->get();
			foreach($sts as $st) {
				$userIds[] = $st->admin_user_id;

				$data['title'] = '通知';
				$data['cate_id'] = 1;
				$data['content'] = '<p>'.$st->station_name . $item->remark.'</p>';
				$data['receive_type'] = 1;
				$data['post_user_id'] = 1;
				$data['receive_user_ids'] = $userIds;
				$data['source'] = 1;
				Article::create($data);
			}
		}
	}
}
