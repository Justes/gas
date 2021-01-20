<?php

namespace App\Admin\Controllers;

use App\Models\{StationExam, Station, StationExamStd, Standard, Event};
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Encore\Admin\Widgets\Table;

class FireExamController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '消防设施考核';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new StationExam());
		$grid->disableCreateButton();

		$grid->model()->where('std_type', 5)->orderBy('id', 'desc');

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
        $grid->column('score', __('Score'));
		$grid->column('fire_num', __('Fire num'));
		$grid->column('fire_result', __('Fire result'));
        $grid->column('exam_date', __('Exam date'));
        $grid->column('exam_status_text', __('Exam status'));
		$grid->column('report_text', __('Report status'));

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
			$form->select('station_id', __('Station id'))->options(Station::all()->pluck('station_name', 'id'));

			$stds = Standard::where('std_type', 5)->get();
			foreach($stds as $item) {
				$rows[] = [$item->id, $item->project, $item->weight, $item->standard, '<input class="real" name="real['.$item->id.']"/ >', '<select name="res['.$item->id.']"><option value="0">不通过</option><option value="1">通过</option></select>'];
			}
		} else {
			$form->display('station.company.company_name', __('Company id'));
			$form->display('station.company.addr', __('Addr'));
			$form->display('station.station_name', __('Station id'));
			$form->display('station.company.legal_name', __('Legal name'));
			$form->display('station.company.legal_mobile', __('Legal mobile'));

			$form->divider();
			$form->display('quarter_text', '上报周期');
			$form->display('fire_num', __('Fire num'));
			$form->file('manage_file', '消防设施情况')->readonly();
			$form->display('user_name', '上报人');
			$form->display('report_time', '上报时间');

			$id = request()->route()->parameters()['fire_exam'];

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
        $form->text('fire_result', __('消防设施合格率'));
        $form->number('score', __('Score'))->default(0);
        $form->date('exam_date', __('Exam date'))->default(date("Y-m-d"));
        $form->radio('exam_status', __('Exam status'))->options(['未考核', '已考核']);
		$form->hidden('std_type')->default(5);
        $form->textarea('remark', '企业改进建议');

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

