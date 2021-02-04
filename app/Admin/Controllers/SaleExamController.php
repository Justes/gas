<?php

namespace App\Admin\Controllers;

use App\Models\{StationExam, Station, StationExamStd, Standard, Event, BottleSaleDetail, Zone};
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Encore\Admin\Widgets\Table;

class SaleExamController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '瓶装液化气补贴';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new StationExam());

		$grid->model()->where('std_type', 0)->orderBy('id', 'desc');

		$grid->filter(function($filter) {
			$filter->disableIdFilter();
			$filter->equal('station_id', __('场站名'))->select(Station::all()->pluck('station_name', 'id'));
			$filter->equal('exam_status', __('Ck status'))->select(['未审核', '已审核']);
		});

        $grid->column('id', __('Id'));
        $grid->column('year', __('Year'));
		$grid->column('zones', __('Zones'))->display(function($v) {
			if(empty($v)) {
				$zones = Zone::all();
				$str = '';
				foreach($zones as $item) {
					if(is_array($item->station_ids) && in_array($this->station_id, $item->station_ids)) {
						$str .= $item->zone_range.', ';
					}
				}
				$str = rtrim($str, ', ');
				StationExam::where('id', $this->id)->update(['zones' => $str]);
				$v = $str;
			}
			return $v;
		})->width(200);
        $grid->column('station_name', __('Station id'));
        $grid->column('company_name', __('Company id'));
		$grid->column('bottle_sum', __('Bottle sum'))->display(function($v) {
			if(empty($v)) {
				$num = BottleSaleDetail::where(['station_id' => $this->station_id, 'year' => $this->year])->sum('sale_num');
				StationExam::where('id', $this->id)->update(['bottle_sum' => $num]);
				return $num;
			}
			return $v;
		});
		$grid->column('time_range', __('Time range'))->display(function() {
			return $this->begin_time . '~' . $this->end_time;
		});
		$grid->column('real_bonus', __('Real bonus'))->display(function($v) {
			if(empty(intval($v))) {
				$bonus = BottleSaleDetail::where(['station_id' => $this->station_id, 'year' => $this->year])->sum('bonus');
				StationExam::where('id', $this->id)->update(['real_bonus' => $bonus]);
				return $bonus;
			}
			return $v;
		});

		$grid->column('created_at', __('Created at'));

        //$grid->column('status_text', __('Ck status'));
        //$grid->column('report_text', __('Report status'));

		$grid->actions(function($row) {
			$row->disableView();
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
		$headers = ['编号', '项目', '权重', '标准', '补贴金额', '实际数据', '应补贴金额(元)'];

		if($form->isCreating()) {
			$form->select('station_id', __('Station id'))->options(Station::all()->pluck('station_name', 'id'))->rules('required');

			$stds = Standard::where('std_type', 0)->get();
			foreach($stds as $item) {
				$rows[] = [$item->id, $item->project, $item->weight, $item->standard, $item->bonus, '<input class="real" name="real['.$item->id.']"/ >', '<input name="res['.$item->id.']" value="'.$item->real_bonus.'" />'];
			}
		} else {
			$form->display('station.company.company_name', __('Company id'));
			$form->display('station.company.addr', __('Addr'));
			$form->display('station.station_name', __('Station id'));
			$form->display('station.company.legal_name', __('Legal name'));
			$form->display('station.company.legal_mobile', __('Legal mobile'));

			$form->divider();
			$form->display('consume', __('Sales'));
			$form->file('manage_file', '数据凭证')->readonly();
			$form->display('user_name', '上报人');
			$form->display('report_time', '上报时间');

			$id = request()->route()->parameters()['sale_exam'];

			$stds = StationExamStd::where('station_exam_id', $id)->get();
			foreach($stds as $item) {
				$sel = empty($item->result) ? "" : "selected";

				$rows[] = [$item->id, $item->project, $item->weight, $item->standard, $item->bonus, '<input class="real" name="real['.$item->id.']" value="'.$item->real_data.'" / >', '<input name="res['.$item->id.']" value="'.$item->real_bonus.'" />'];
			}
		}
		$table = new Table($headers, $rows);

		$form->divider();
		$form->html($table->render());

		$form->divider();
        $form->year('year', __('Year'))->default(date("Y-m-d"));
        $form->date('exam_date', '审核时间')->default(date("Y-m-d"));
        $form->number('bottle_sum', __('Bottle sum'))->default(0);
        $form->text('real_bonus', __('Real bonus'))->default(0);
        $form->radio('exam_status', __('Ck status'))->options(['未审核', '已审核']);
		$form->hidden('std_type')->default(0);

		$form->saving(function(Form $form) {
			if($form->res) {
				$res = $form->res;
				$realBonus = 0;
				foreach($res as $item) {
					$realBonus += $item;
				}
				$form->real_bonus = $realBonus;
			}
		});

		$form->saved(function(Form $form) {
			if($form->real) {
				$real = $form->real;
				$res = $form->res;

				foreach($real as $key => $item) {
					$data['station_exam_id'] = $form->model()->id;
					$data['real_data'] = $item;
					$data['real_bonus'] = $res[$key];
					
					if($form->isCreating()) {
						$std = Standard::find($key);
						$data['project'] = $std->project;
						$data['weight'] = $std->weight;
						$data['standard'] = $std->standard;
						$data['bonus'] = $std->bonus;
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

