<?php

namespace App\Http\Controllers\Api;
use Illuminate\Http\Request;
use App\Models\{Article, ArticleView, Attachment};

class ArticleController extends BaseController {

	public function index(Request $req) {
		$articleType = $req->article_type;

		$uid = $this->uid();
		$arts = Article::where(['effect_status' => 0, 'post_status' => 0, 'article_type' => $articleType])->where(function($query) use ($uid) {
			$query->where('receive_type', 0)
				->orWhere('receive_user_ids', 'like', "%{$uid}%");

		})->orderBy('send_time', 'desc')->paginate(20)->items();

		$arr = [];
		foreach($arts as $item) {
			if($item->receive_type == 1) {
				if(!in_array($uid, $item->receive_user_ids)) {
					continue;
				}
			}

			$tmp = $item->toArray();
			unset($tmp['admin'], $tmp['cate']);
			$tmp['views'] = ArticleView::where('article_id', $item->id)->count();

			$atts = Attachment::where('article_id', $item->id)->get();
			$atArr = [];
			foreach($atts as $at) {
				$t['file_name'] = $at->file_name;
				$t['file_url'] = $at->file_url;
				$t['file_ext'] = $at->file_ext;
				$atArr[] = $t;
			}

			$tmp['attaches'] = $atArr;
			$view = ArticleView::where(['article_id' => $item->id, 'user_id' => $this->uid()])->first();
			$tmp['read'] = empty($view) ? 0 : 1;
			$arr[] = $tmp;
		}

		$data['articles'] = $arr;

		$artIds = Article::where(['effect_status' => 0, 'post_status' => 0, 'article_type' => $articleType])->where(function($query) use ($uid) {
			$query->where('receive_type', 0)
				->orWhere('receive_user_ids', 'like', "%{$uid}%");
		})->pluck('id');

		$data['unread'] = 0;

		foreach($artIds as $aid) {
			$view = ArticleView::where(['article_id' => $aid, 'user_id' => $this->uid()])->first();
			if(empty($view)) {
				$data['unread']++;
			}
		}

		return err(0, $data);
	}

	public function view(Request $req) {
		$rules = $this->required($req, ['article_id']);
		if($rules) return err(4001, $rules);

		$art = Article::find($req->article_id);
		$data = ['article_id' => $req->article_id, 'user_id' => $this->uid()];
		ArticleView::firstOrCreate($data, $data);
		return err();
	}

	public function files(Request $req) {
		if($req->file_name) {
			$attaches = Attachment::where('path', 'like', "%{$req->file_name}%")orderBy('id', 'desc')->paginate();
		} else {
			$attaches = Attachment::orderBy('id', 'desc')->paginate();
		}
		$arr = [];
		foreach($attaches as $attach) {
			$tmp = $attach->toArray();
			unset($tmp['article']);
			$arr[] = $tmp;
		}
		return err(0, $arr);
	}

}
