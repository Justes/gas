<?php

namespace App\Admin\Controllers;

use App\Models\{StationExam, Station, StationExamStd, Standard, Event, CertPeriod};
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Encore\Admin\Widgets\Table;

class CertExamController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '经营许可证审核';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new StationExam());

		$grid->model()->where('std_type', 2)->orderBy('id', 'desc');

		$grid->filter(function($filter) {
			$filter->disableIdFilter();
			$filter->equal('station_id', __('场站名'))->select(Station::all()->pluck('station_name', 'id'));
			$filter->equal('quarter', '考核季度')->select(['','第一季度', '第二季度', '第三季度', '第四季度']);
			$filter->equal('exam_status', '考核状态')->select(['未考核', '已考核']);
		});

        $grid->column('id', __('Id'));
        $grid->column('year', __('Year'));
        $grid->column('station_name', __('Station id'));
        $grid->column('company_name', __('Company id'));
        $grid->column('effect_begin', __('Effect begin'));
        $grid->column('effect_end', __('Effect end'));
        $grid->column('exam_date', __('Exam date'));
        $grid->column('exam_status_text', __('Ck status'));

		$grid->actions(function($row) {
			$row->disableView();
			$row->disableDelete();
		});

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
		$headers = ['编号', '项目', '权重', '标准', '实际数据', '结果'];

		if($form->isCreating()) {
			$form->select('station_id', __('Station id'))->options(Station::all()->pluck('station_name', 'id'))->rules('required');

			$stds = Standard::where('std_type', 2)->get();
			foreach($stds as $item) {
				$rows[] = [$item->id, $item->project, $item->weight, $item->standard, '<input class="real" name="real['.$item->id.']"/ >', '<select name="res['.$item->id.']"><option value="0">不通过</option><option value="1">通过</option></select>'];
			}
		} else {
			$form->display('station.company.company_name', __('Company id'));
			$form->display('station.company.addr', __('Addr'));
			$form->display('station.station_name', __('Station id'));
			$form->display('station.company.legal_name', __('Legal name'));
			$form->display('station.company.legal_mobile', __('Legal mobile'));

			$id = request()->route()->parameters()['cert_exam'];

			$stds = StationExamStd::where('station_exam_id', $id)->get();
			foreach($stds as $item) {
				$sel = empty($item->result) ? "" : "selected";

				$rows[] = [$item->id, $item->project, $item->weight, $item->standard, '<input class="real" name="real['.$item->id.']" value="'.$item->real_data.'" / >', '<select name="res['.$item->id.']"><option value="0"'.$sel.'>不通过</option><option value="1"'.$sel.'>通过</option></select>'];
			}
		}
		$table = new Table($headers, $rows);

		$form->divider();
		$form->html($table->render());

		$form->divider();
		$form->year('year', '年度')->default(date("Y"));
        $form->date('exam_date', '审核时间')->default(date("Y-m-d"));
        $form->radio('exam_status', __('Ck status'))->options(['未审核', '已审核']);
		$form->hidden('std_type')->default(2);
		$form->hidden('effect_begin');
		$form->hidden('effect_end');

		$form->saving(function(Form $form) {
			if($form->exam_status == 1) {
				$form->effect_begin = $form->exam_date;

				$per = CertPeriod::first();
				$form->effect_end = date("Y-m-d", strtotime($form->effect_begin . ' 00:00:00') + $per->effect_type * 365 * 86400);
			}
		});

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

