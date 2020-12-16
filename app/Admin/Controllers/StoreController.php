<?php

namespace App\Admin\Controllers;

use App\Models\Attachment;
use App\Http\Controllers\Controller;
use Encore\Admin\Layout\Column;
use Encore\Admin\Layout\Content;
use Encore\Admin\Layout\Row;
use Encore\Admin\Widgets\Box;
use Illuminate\Support\Facades\Storage;


class StoreController extends Controller
{
	public function index(Content $content)
    {
		$data = ['doc' => 0, 'xls' => 0, 'ppt' => 0, 'jpg' => 0, 'png' => 0, 'zip' => 0, 'unknown' => 0];
		$files = Storage::disk('admin')->allFiles('/');
		$cnt = count($files);
		$size = 0;
		foreach($files as $item) {
			$key = ext($item);
			if(!array_key_exists($key, $data)) {
				$key = 'unknown';
			}
			$data[$key]++;
			$size += Storage::disk('admin')->size($item);
		}

		$m = $size / 1024 / 1204;
		$used = number_format($m, 2, '.', '');

        return $content
            ->title('存储空间')
            ->body(new Box('已使用:'.$used.'MB,  文件数量:'.$cnt, view('admin.store', compact('used', 'data', 'cnt'))));
    }
}
