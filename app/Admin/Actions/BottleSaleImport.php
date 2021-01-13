<?php

namespace App\Admin\Actions;

use Encore\Admin\Actions\Action;
use Illuminate\Http\Request;
use App\Imports\SaleImport;
use Maatwebsite\Excel\Facades\Excel;

class BottleSaleImport extends Action
{
    protected $selector = '.bottole-sale-import';

    public function handle(Request $request)
    {
        // $request ...
		$file = $request->file('file');
		Excel::import(new SaleImport, $file);

        return $this->response()->success('Success message...')->refresh();
    }

	public function form() {
		$this->file('file', '请选择文件');
	}

    public function html()
    {
        return <<<HTML
        <a class="btn btn-sm btn-default bottole-sale-import">导入数据</a>
HTML;
    }
}
