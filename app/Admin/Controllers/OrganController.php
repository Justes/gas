<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Organ;
use Encore\Admin\Tree;
use Encore\Admin\Form;
use Encore\Admin\Layout\Content;
use Encore\Admin\Layout\Column;
use Encore\Admin\Layout\Row;
use Encore\Admin\Widgets\Box;
use Illuminate\Http\Request;

class OrganController extends Controller
{
    public function index(Content $content) {
        $tree = new Tree(new Organ);

        return $content
            ->header('组织管理')
			->row(function(Row $row) {
				$row->column(6, $this->treeView()->render());
				$row->column(6, function(Column $column) {

					$form = new \Encore\Admin\Widgets\Form();
                    $form->action(admin_url('organs/store'));

                    $menuModel = new Organ();

                    $form->select('pid', __('Pid'))->options($menuModel::selectOptions());
                    $form->text('organ_name', __('Organ name'))->rules('required');
                    $column->append((new Box(trans('admin.new'), $form))->style('success'));
				});
			});
    }

	protected function treeView()
    {
        $tree = new Tree(new Organ);
        $tree->disableCreate();
        $tree->branch(function ($branch) {
            $payload = "<i class='fa fa-bars'></i>&nbsp;<strong>{$branch['organ_name']}</strong>";
            return $payload;
        });

        return $tree;
    }

	public function store() {
		$data['pid'] = request('pid', 0);
		$data['organ_name'] = request('organ_name');
		Organ::create($data);
		return back();
	}

	public function edit($id, Content $content) {
        return $content
            ->title(__('组织管理'))
            ->row($this->form()->edit($id));
    }

	public function form() {
        $menuModel = new Organ;
        $form = new Form(new Organ);

        $form->display('id', 'ID');
        $form->select('pid', __('Pid'))->options($menuModel::selectOptions());
        $form->text('organ_name', __('Organ name'))->rules('required');
        $form->display('created_at', trans('admin.created_at'));

        return $form;
    }

	public function update($id) {
        return $this->form()->update($id);
	}

	public function lists(Request $req) {
		$pid = $req->get('q');
		return Organ::where('pid', $pid)->get(['id', \DB::raw('organ_name as text')]);
	}

}
