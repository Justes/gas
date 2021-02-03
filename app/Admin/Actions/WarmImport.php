<?php

namespace App\Admin\Actions;

use Encore\Admin\Actions\Action;
use Illuminate\Http\Request;
use App\Imports\WarmDetailImport;
use Maatwebsite\Excel\Facades\Excel;

class WarmImport extends Action
{
    protected $selector = '.warm-detail-import';

    public function handle(Request $request)
    {
        // $request ...
		$file = $request->file('file');
		Excel::import(new WarmDetailImport, $file);

        return $this->response()->success('导入成功')->refresh();
    }

	public function form() {
		$this->file('file', '请选择文件');
	}

    public function html()
    {
        return <<<HTML
        <a class="btn btn-sm btn-primary warm-detail-import">导入数据</a>
HTML;
    }
}
