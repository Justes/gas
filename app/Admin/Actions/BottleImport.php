<?php

namespace App\Admin\Actions;

use Encore\Admin\Actions\Action;
use Illuminate\Http\Request;
use App\Imports\BottleDetailImport;
use Maatwebsite\Excel\Facades\Excel;

class BottleImport extends Action
{
    protected $selector = '.bottole-detail-import';

    public function handle(Request $request)
    {
        // $request ...
		$file = $request->file('file');
		Excel::import(new BottleDetailImport, $file);

        return $this->response()->success('导入成功')->refresh();
    }

	public function form() {
		$this->file('file', '请选择文件');
	}

    public function html()
    {
        return <<<HTML
        <a class="btn btn-sm btn-primary bottole-detail-import">导入数据</a>
HTML;
    }
}
