<?php

namespace App\Admin\Controllers;

use App\Models\{StationExam, Station, StationExamStd, Standard, Event};
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Encore\Admin\Widgets\Table;
use Illuminate\Support\Facades\Auth;

class EventExamController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '事件考核管理';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new StationExam());

		$grid->model()->where('std_type', 4)->orderBy('id', 'desc');

		$grid->filter(function($filter) {
			$filter->disableIdFilter();
			$filter->equal('station_id', __('场站名'))->select(Station::all()->pluck('station_name', 'id'));
			//$filter->equal('period', '考核周期')->select(['周度', '月度', '季度', '年度']);
			$filter->equal('exam_status', '考核状态')->select(['未考核', '已考核']);
		});

        $grid->column('id', __('Id'));
        $grid->column('year', __('Year'));
        $grid->column('station_name', __('Station id'));
        $grid->column('company_name', __('Company id'));
        //$grid->column('period_text', __('Period'));
        $grid->column('score', __('Score'))->sortable();
        $grid->column('event_deal_cnt', __('Event deal cnt'));
        $grid->column('event_per', __('Event per'));
        $grid->column('exam_date', __('Exam date'));
        $grid->column('exam_status_text', __('Exam status'));

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
        //$show->field('period', __('Period'));
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
		$headers = ['编号', '项目', '权重', '标准', '实际数据', '得分', '结果'];

		if($form->isCreating()) {
			$form->select('station_id', __('Station id'))->options(Station::all()->pluck('station_name', 'id'))->rules('required');

			$stds = Standard::where('std_type', 4)->get();
			foreach($stds as $item) {
				$rows[] = [$item->id, $item->project, $item->weight, $item->standard, '<input class="real" name="real['.$item->id.']" style="padding-right:5px;text-align:right;"  / >', '<input class="scores" name="scores['.$item->id.']" style="padding-right:5px;text-align:right;" />', '<select name="res['.$item->id.']"><option value="0">不通过</option><option value="1">通过</option></select>'];
			}
		} else {
			$form->display('station.company.company_name', __('Company id'));
			$form->display('station.company.addr', __('Addr'));
			$form->display('station.station_name', __('Station id'));
			$form->display('station.company.legal_name', __('Legal name'));
			$form->display('station.company.legal_mobile', __('Legal mobile'));

			$id = request()->route()->parameters()['event_exam'];

			$stds = StationExamStd::where('station_exam_id', $id)->get();
			foreach($stds as $item) {
				$sel = empty($item->result) ? "" : "selected";

				$rows[] = [$item->id, $item->project, $item->weight, $item->standard, '<input class="real" name="real['.$item->id.']" style="padding-right:5px;text-align:right;" value="'.$item->real_data.'" / >', '<input class="scores" name="scores['.$item->id.']" style="padding-right:5px;text-align:right;" value="'.$item->score.'">',  '<select name="res['.$item->id.']"><option value="0"'.$sel.'>不通过</option><option value="1"'.$sel.'>通过</option></select>'];
			}
		}
		$table = new Table($headers, $rows);

		$form->divider();
		$form->html($table->render());

		$form->divider();
        $form->number('score', __('Score'))->default(0);
		$form->date('begin_time', __('Begin time'));
        $form->date('end_time', __('End time'));
        $form->date('exam_date', __('Exam date'))->default(date("Y-m-d"));
        $form->radio('exam_status', __('Exam status'))->options(['未考核', '已考核']);
        $form->textarea('remark', __('Remark'));
        $form->textarea('edit_log', __('Edit log'))->readonly();
		$form->hidden('std_type')->default(4);
		$form->hidden('event_deal_cnt')->default(0);
		$form->hidden('event_cnt')->default(0);
		$form->hidden('event_per');
		$form->hidden('year');

		$form->saving(function(Form $form) {
			if($form->isCreating()) {
				$st = StationExam::where('std_type', 4)->orderBy('id', 'desc')->first();
				$begin = 0;
				if($st) {
					$begin = $st->exam_date;
				}
				$form->event_deal_cnt = Event::where([['station_id',  $form->station_id], ['event_status', 1], ['created_day', '>=', $begin], ['created_day', '<=', $form->exam_date]])->count();
				$form->event_cnt = Event::where([['station_id',  $form->station_id], ['created_day', '>=', $begin], ['created_day', '<=', $form->exam_date]])->count();
				if($form->event_cnt) {
					$form->event_per = ceil(($form->event_deal_cnt / $form->event_cnt) * 100) .'%';
				}

				$form->year = date("Y");
			}

		});

		$form->saved(function(Form $form) {
			if($form->real) {
				$real = $form->real;
				$res = $form->res;
				$scores = $form->scores;
				$score = 0;
				$str = '';
				$results = ['不通过', '通过'];

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

						$str .= '项目:'.$data['project'].' 权重:'.$data['weight']. ' 标准:'.$data['standard']. ' 实际数据:'.$data['real_data']. ' 得分:'.$data['score']. ' 结果:'. $results[$data['result']] . '&#10;';

						StationExamStd::create($data);
					} else {
						$ses = StationExamStd::find($key);
						$data['weight'] = $ses->weight;

						$str .= '项目:'.$ses['project'].' 权重:'.$ses['weight']. ' 标准:'.$ses['standard']. ' 实际数据:'.$data['real_data']. ' 得分:'.$data['score']. ' 结果:'. $results[$data['result']] . '&#10;';
						StationExamStd::where('id', $key)->update($data);
					}
					$score += $data['weight'] * $data['score'];
				}

				$score = round($score / 100);

				$exam = StationExam::where('id', $form->model()->id)->first();
				$editLog = $exam->edit_log .'&#10;&#10;';

				$station = Station::where('id', $exam->station_id)->first();
				$estatus = ['未考核', '已考核'];

				if($form->isCreating()) {
					if($station) {
						$editLog .= date("Y-m-d H:i:s") .' ' . Auth::user()->name . ' 创建了:&#10;场站:' . $station->station_name . ' 综合得分:'.$score. ' 开始时间:'.$form->begin_time . ' 结束时间:'.$form->end_time . ' 考核时间:'.$form->exam_date. ' 考核状态:'.$estatus[$form->exam_status]. '&#10;' . $str . ' 备注:'. $form->remark. '&#10;';
					}
				} else {
					$editLog .= date("Y-m-d H:i:s") .' ' . Auth::user()->name . ' 修改为:&#10;场站:' . $station->station_name . ' 综合得分:'.$score. ' 开始时间:'.$form->begin_time . ' 结束时间:'.$form->end_time . ' 考核时间:'.$form->exam_date. ' 考核状态:'.$estatus[$form->exam_status]. '&#10;' . $str . ' 备注:'. $form->remark.'&#10;';
				}
				StationExam::where('id', $form->model()->id)->update(['score' => $score, 'edit_log' => $editLog]);
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
