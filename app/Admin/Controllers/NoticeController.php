<?php

namespace App\Admin\Controllers;

use App\Models\Article;
use App\Http\Controllers\Controller;
use Encore\Admin\Layout\Column;
use Encore\Admin\Layout\Content;
use Encore\Admin\Layout\Row;
use Encore\Admin\Widgets\Box;
use Illuminate\Support\Facades\Storage;


class NoticeController extends Controller
{
	public $title = '系统公告';

	public function index(Content $content)
    {
		$w['post_status'] = 0;
		$w['article_type'] = $articleType = request('article_type', 0);
		$per = request('per_page', 10);
		$articles = Article::where($w)->orderBy('id', 'desc')->paginate($per);
		$types = ['公告通知', '安全教育', '政策法规'];
		$pers = [10, 20, 30, 50, 100];

        return $content
            ->title($this->title)
            ->body(new Box('', view('admin.notice-list', compact('articles', 'types', 'articleType', 'pers', 'per'))));
    }

	public function show(Content $content, $id) {
		$article = Article::find($id);

        return $content
            ->title($this->title)
            ->body(new Box('', view('admin.notice-show', compact('article'))));
	}
}
