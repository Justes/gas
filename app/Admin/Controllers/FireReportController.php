<?php

namespace App\Admin\Controllers;

use App\Models\{ReportPeriod, Station, StationExam, Standard, StationExamStd};
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class FireReportController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '消防上报';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new ReportPeriod());
		$grid->model()->where('std_type', 5)->orderBy('id', 'desc');

        $grid->column('id', __('Id'));
        $grid->column('year', __('Year'));
        $grid->column('begin_time', __('Begin time'));
        $grid->column('end_time', __('End time'));
        $grid->column('final_time', __('Final time'));

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
        $show = new Show(ReportPeriod::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('year', __('Year'));
        $show->field('begin_time', __('Begin time'));
        $show->field('end_time', __('End time'));
        $show->field('final_time', __('Final time'));
        $show->field('std_type', __('Std type'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new ReportPeriod());

        $form->year('year', __('Year'))->default(date('Y'));
        $form->date('begin_time', __('Begin time'))->default(date('Y-m-d'));
        $form->date('end_time', __('End time'))->default(date('Y-m-d'));
        $form->date('final_time', __('Final time'))->default(date('Y-m-d'));
        $form->hidden('std_type', __('Std type'))->default(5);

		$form->saved(function(Form $form) {
			$sts = Station::all();
			foreach($sts as $st) {
				$data['year'] = $form->year;
				$data['begin_time'] = $form->begin_time;
				$data['end_time'] = $form->end_time;
				$data['final_time'] = $form->final_time;
				$data['std_type'] = $form->std_type;
				$data['station_id'] = $st->id;
				$data['company_id'] = $st->company_id;
				$exam = StationExam::create($data);

				$stds = Standard::where('std_type', $form->std_type)->get();
				foreach($stds as $std) {
					$d['project'] = $std->project;
					$d['weight'] = $std->weight;
					$d['standard'] = $std->standard;
					$d['standard_id'] = $std->id;
					$d['station_exam_id'] = $exam->id;
					$d['bonus'] = $std->bonus;
					$d['result'] = 0;
					StationExamStd::create($d);
				}
			}
		});

        return $form;
    }
}
