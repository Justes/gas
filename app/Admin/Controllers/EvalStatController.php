<?php

namespace App\Admin\Controllers;

use App\Models\{StationExam, Station, StationExamStd, Standard, Event, CertPeriod};
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Encore\Admin\Widgets\Table;
use Encore\Admin\Widgets\Box;

class EvalStatController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '汇总排名';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new StationExam());
		$grid->disablePagination();

		$grid->model()->where('std_type', 9)->orderBy('id', 'desc');
		$grid->disableCreateButton();
		$grid->disableColumnSelector();
		$grid->disableRowSelector();
		$grid->disableFilter();
		$grid->disableExport();


		$grid->filter(function($filter) {
			$filter->disableIdFilter();
			$filter->equal('station_id', __('场站名'))->select(Station::all()->pluck('station_name', 'id'));
			$filter->equal('quarter', '考核季度')->select(['','第一季度', '第二季度', '第三季度', '第四季度']);
			$filter->equal('exam_status', '审核状态')->select(['未审核', '已审核', '驳回']);
		});

        $grid->column('id', __('Id'));
        $grid->column('year', __('Year'));
        $grid->column('station_name', __('Station id'));
        $grid->column('company_name', __('Company id'));
        $grid->column('score', __('Score'));
        $grid->column('exam_date', '审核时间');
        $grid->column('status_text', __('Ck status'));

		$grid->header(function ($query) {
			$d = $query->get();
			$bar = $d->pluck('score', 'station_name')->toArray() ?? [];

			$doughnut = view('admin.eval-stat', compact('bar'));
			return new Box('站点排名', $doughnut);
		});

		$grid->disableActions();

		/*
		$grid->actions(function($row) {
			$row->disableView();
			$row->disableEdit();
			$row->disableDelete();
		});
		 */

        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(StationExam::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('period', __('Period'));
        $show->field('quarter', __('Quarter'));
        $show->field('station_id', __('Station id'));
        $show->field('score', __('Score'));
        $show->field('exam_status', __('Exam status'));
        $show->field('exam_date', __('Exam date'));
        $show->field('remark', __('Remark'));
        $show->field('created_at', __('Created at'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new StationExam());

        //$form->select('quarter', __('Quarter'))->options([1 => '第一季度', 2 => '第二季度', 3 => '第三季度', 4 => '第四季度']);
        //$form->textarea('remark', __('Remark'));

		$rows = [];
		$headers = ['编号', '项目', '权重', '标准', '实际数据', '结果(分)'];

		if($form->isCreating()) {
			$form->select('station_id', __('Station id'))->options(Station::all()->pluck('station_name', 'id'))->rules('required');

			$stds = Standard::where('std_type', 9)->get();
			foreach($stds as $item) {
				$rows[] = [$item->id, $item->project, $item->weight, $item->standard, '<input class="real" name="real['.$item->id.']"/ >', '<input name="res['.$item->id.']" value="'.$item->result.'" />'];
			}
		} else {
			$form->display('station.company.company_name', __('Company id'));
			$form->display('station.company.addr', __('Addr'));
			$form->display('station.station_name', __('Station id'));
			$form->display('station.company.legal_name', __('Legal name'));
			$form->display('station.company.legal_mobile', __('Legal mobile'));

			$id = request()->route()->parameters()['eval_stat'];

			$stds = StationExamStd::where('station_exam_id', $id)->get();
			foreach($stds as $item) {
				$sel = empty($item->result) ? "" : "selected";

				$rows[] = [$item->id, $item->project, $item->weight, $item->standard, '<input class="real" name="real['.$item->id.']" value="'.$item->real_data.'" / >', '<input name="res['.$item->id.']" value="'.$item->result.'" />'];
			}
		}
		$table = new Table($headers, $rows);

		$form->divider();
		$form->html($table->render());

		$form->divider();
		$form->number('score', __('Score'))->default(0);
		$form->year('year', '年度')->default(date("Y"));
        $form->date('exam_date', '审核时间')->default(date("Y-m-d"));
        $form->radio('exam_status', __('Ck status'))->options(['未审核', '已审核', '驳回']);
        $form->textarea('remark', '企业改进建议');
		$form->hidden('std_type')->default(9);

		$form->saved(function(Form $form) {
			if($form->real) {
				$real = $form->real;
				$res = $form->res;

				foreach($real as $key => $item) {
					$data['station_exam_id'] = $form->model()->id;
					$data['real_data'] = $item;
					$data['result'] = $res[$key];
					
					if($form->isCreating()) {
						$std = Standard::find($key);
						$data['project'] = $std->project;
						$data['weight'] = $std->weight;
						$data['standard'] = $std->standard;
						$data['standard_id'] = $key;
						StationExamStd::create($data);
					} else {
						StationExamStd::where('id', $key)->update($data);
					}
				}
			}
		});

		$form->tools(function(Form\Tools $tools) {
			$tools->disableDelete();
			$tools->disableView();
		});

		$form->footer(function ($footer) {
			$footer->disableReset();
			$footer->disableViewCheck();
			$footer->disableEditingCheck();
			$footer->disableCreatingCheck();
		});

        return $form;
    }
}

