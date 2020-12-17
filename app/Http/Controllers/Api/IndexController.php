<?php

namespace App\Http\Controllers\Api;
use App\Models\Article;

class IndexController extends BaseController {

	public function index() {
		$arts = Article::where(['effect_status' => 0, 'effect_type' => 1])->get();
		$now = time();
		foreach($arts as $item) {
			$end = strtotime($item->send_time) + $item->effect_days * 86400;
			if($end < $now) {
				$item->effect_status = 1;
				$item->save();
				echo $item->id.' expired <br/>';
			}
		}
	}
}
