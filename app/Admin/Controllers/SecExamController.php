<?php

namespace App\Admin\Controllers;

use App\Models\{StationExam, Station, StationExamStd, Standard, Event};
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Encore\Admin\Widgets\Table;

class SecExamController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '安全作业考核';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new StationExam());
		$grid->disableCreateButton();

		$grid->model()->where('std_type', 6)->orderBy('id', 'desc');

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
        $grid->column('score', __('Score'))->sortable();
		$grid->column('sec_ck_num', __('Sec ck num'));
		$grid->column('sec_ck_result', __('Sec ck result'));
		$grid->column('sec_fix_num', __('Sec fix num'));
		$grid->column('sec_fix_result', __('Sec fix result'));
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

			$stds = Standard::where('std_type', 6)->get();
			foreach($stds as $item) {
				$rows[] = [$item->id, $item->project, $item->weight, '<div style="width:200px;">'.$item->standard.'</div>', '<input class="real" name="real['.$item->id.']" style="padding-right:5px;text-align:right;"  / >', '<input class="scores" name="scores['.$item->id.']" style="padding-right:5px;text-align:right;" />', '<select name="res['.$item->id.']"><option value="0">不通过</option><option value="1">通过</option></select>'];
			}
		} else {
			$form->display('station.company.company_name', __('Company id'));
			$form->display('station.company.addr', __('Addr'));
			$form->display('station.station_name', __('Station id'));
			$form->display('station.company.legal_name', __('Legal name'));
			$form->display('station.company.legal_mobile', __('Legal mobile'));

			$form->divider();
			$form->display('quarter_text', '上报周期');
			$form->display('sec_ck_num', __('Sec ck num'));
			$form->display('sec_fix_num', __('Sec fix num'));
			$form->file('manage_file', '安全作业情况')->readonly();
			$form->display('user_name', '上报人');
			$form->display('report_time', '上报时间');

			$id = request()->route()->parameters()['sec_exam'];

			$stds = StationExamStd::where('station_exam_id', $id)->get();
			foreach($stds as $item) {
				$sel = empty($item->result) ? "" : "selected";

				$rows[] = [$item->id, $item->project, $item->weight, '<div style="width:200px;">'.$item->standard.'</div>',  '<input class="real" name="real['.$item->id.']" style="padding-right:5px;text-align:right;" value="'.$item->real_data.'" / >', '<input class="scores" name="scores['.$item->id.']" style="padding-right:5px;text-align:right;" value="'.$item->score.'">', '<select name="res['.$item->id.']"><option value="0"'.$sel.'>不通过</option><option value="1"'.$sel.'>通过</option></select>'];
			}
		}
		$table = new Table($headers, $rows);

		$form->divider();
		$form->html($table->render());

		$form->divider();
        $form->text('sec_ck_result', __('Sec ck result'));
        $form->text('sec_fix_result', __('Sec fix result'));
        $form->number('score', __('Score'))->default(0);
        $form->date('exam_date', __('Exam date'))->default(date("Y-m-d"));
        $form->radio('exam_status', __('Exam status'))->options(['未考核', '已考核']);
		$form->hidden('std_type')->default(6);
        $form->textarea('remark', '安全作业改进建议');

		$form->saved(function(Form $form) {
			if($form->real) {
				$real = $form->real;
				$res = $form->res;
				$scores = $form->scores;
				$score = 0;

				foreach($real as $key => $item) {
					$data['station_exam_id'] = $form->model()->id;
					$data['real_data'] = $item;
					$data['result'] = $res[$key];
					$data['score'] = $scores[$key];
					
					if($form->isCreating()) {
						$std = Standard::find($key);
						$data['weight'] = $std->weight;
						$data['project'] = $std->project;
						$data['standard'] = $std->standard;
						$data['standard_id'] = $key;
						StationExamStd::create($data);
					} else {
						$ses = StationExamStd::find($key);
						$data['weight'] = $ses->weight;
						StationExamStd::where('id', $key)->update($data);
					}
					$score += $data['weight'] * $data['score'];
				}

				$score = round($score / 100);

				StationExam::where('id', $form->model()->id)->update(['score' => $score]);
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

