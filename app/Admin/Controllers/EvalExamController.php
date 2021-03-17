<?php

namespace App\Admin\Controllers;

use App\Models\{StationExam, Station, StationExamStd, Standard, Event, CertPeriod};
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Encore\Admin\Widgets\Table;
use App\Admin\Actions\EvalExamImport;

class EvalExamController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '综合评价审核';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new StationExam());

		$grid->model()->where('std_type', 9)->orderBy('id', 'desc');

		$grid->filter(function($filter) {
			$filter->disableIdFilter();
			$filter->equal('station_id', __('场站名'))->select(Station::all()->pluck('station_name', 'id'));
			//$filter->equal('quarter', '考核季度')->select(['','第一季度', '第二季度', '第三季度', '第四季度']);
			//$filter->equal('exam_status', '审核状态')->select(['未审核', '已审核', '驳回']);
		});

        $grid->column('id', __('Id'));
        //$grid->column('year', __('Year'));
        $grid->column('exam_date', '评价时间');
        $grid->column('station_name', __('Station id'));
        $grid->column('company_name', __('Company id'));
        $grid->column('permit_no', __('Permit no'));
        $grid->column('reg_no', __('Reg no'));
		$grid->column('qualify', __('Qualify'))->display(function($v) {
			$arr = ['合格', '不合格'];
			return $arr[$v];
		});
		$grid->column('problem', __('Problem'))->display(function($v) {
			$arr = ['无问题', '有问题'];
			return $arr[$v];
		});
        $grid->column('score', __('Score'))->sortable();
		$grid->column('eval_result', __('Eval result'))->display(function($v) {
			$arr = ['合格', '不合格'];
			return $arr[$v];
		});
        //$grid->column('status_text', __('Ck status'));

		$grid->tools(function (Grid\Tools $tools) {
			$tools->append(new EvalExamImport);
		});

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

        $form->date('exam_date', '评价时间')->default(date("Y-m-d"));


		$rows = [];
		$headers = ['编号', '项目', '权重', '标准', '实际数据', '结果(分)'];

		if($form->isCreating()) {
			$form->select('station_id', __('Station id'))->options(Station::all()->pluck('station_name', 'id'))->rules('required');

			$stds = Standard::where('std_type', 9)->get();
			foreach($stds as $item) {
				$rows[] = [$item->id, $item->project, $item->weight, '<div style="width:200px;">'.$item->standard.'</div>', '<input class="real" name="real['.$item->id.']" style="padding-right:5px;text-align:right;" / >', '<input name="res['.$item->id.']" style="padding-right:5px;text-align:right;" value="'.$item->result.'" />'];
			}
		} else {
			$form->display('station.company.company_name', __('Company id'));
			$form->display('station.company.addr', __('Addr'));
			$form->display('station.station_name', __('Station id'));
			$form->display('station.company.legal_name', __('Legal name'));
			$form->display('station.company.legal_mobile', __('Legal mobile'));

			$id = request()->route()->parameters()['eval_exam'];

			$stds = StationExamStd::where('station_exam_id', $id)->get();
			foreach($stds as $item) {
				$sel = empty($item->result) ? "" : "selected";

				$rows[] = [$item->id, $item->project, $item->weight, '<div style="width:200px;">'.$item->standard.'</div>', '<input class="real" name="real['.$item->id.']" style="padding-right:5px;text-align:right;" value="'.$item->real_data.'" / >', '<input name="res['.$item->id.']" style="padding-right:5px;text-align:right;" value="'.$item->result.'" />'];
			}
		}
		$table = new Table($headers, $rows);

		$form->divider();
		$form->html($table->render());

		$form->divider();
		$form->text('permit_no', __('Permit no'));
		$form->text('reg_no', __('Reg no'));
		$form->radio('qualify', __('Qualify'))->options([0 => '合格', 1 => '不合格']);
		$form->textarea('qualify_desc', __('Qualify desc'));
		$form->radio('problem', __('Problem'))->options([0 => '无问题', 1 => '有问题']);
		$form->textarea('problem_desc', __('Problem desc'));
        $form->textarea('remark', '企业改进建议');

		$form->divider();
		$form->number('score', __('Score'))->default(0);
		//$form->year('year', '年度')->default(date("Y"));
		$form->radio('eval_result', __('Eval result'))->options([0 => '合格', 1 => '不合格']);
		$form->file('manage_file', __('附件'));
        //$form->radio('exam_status', __('Ck status'))->options(['未审核', '已审核', '驳回']);
		$form->hidden('std_type')->default(9);

		$form->saved(function(Form $form) {
			if($form->real) {
				$real = $form->real;
				$res = $form->res;
				$scores = $form->res;
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

