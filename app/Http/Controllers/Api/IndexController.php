<?php

namespace App\Http\Controllers\Api;
use App\Models\Article;

class IndexController extends BaseController {

	public function index() {
		$arts = Article::where(['effect_status' => 0, 'send_type' => 1, 'post_status' => 1])->get();
		$now = time();
		foreach($arts as $item) {
			if($now > strtotime($item->send_time)) {
				$item->post_status = 0;
				$item->save();
				echo 'post '. $item->id . '<br>';
			}
		}
	}
}
