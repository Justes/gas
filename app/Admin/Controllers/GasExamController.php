<?php

namespace App\Admin\Controllers;

use App\Models\{StationExam, Station, StationExamStd, Standard, Event, Company};
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Encore\Admin\Widgets\Table;

class GasExamController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '用气量监控';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new StationExam());
		$grid->disableCreateButton();

		$grid->model()->where('std_type', 8)->orderBy('id', 'desc');

		$grid->filter(function($filter) {
			$filter->disableIdFilter();
			//$filter->equal('station_id', __('场站名'))->select(Station::all()->pluck('station_name', 'id'));
			$filter->equal('company_id', __('公司名'))->select(Company::all()->pluck('company_name', 'id'));
			$filter->year('report_time', '年')->default(date('Y'));
		});

        $grid->column('id', __('Id'));
        $grid->column('year', __('Year'));
        $grid->column('station_name', __('Station id'));
        $grid->column('company_name', __('Company id'));
        $grid->column('consume', '用气量数据(L)');
        $grid->column('report_text', __('Report status'));

		$grid->actions(function($actions) {
			$actions->disableView();
			$actions->disableDelete();
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

		$form->display('station.company.company_name', __('Company id'));
		$form->display('station.company.addr', __('Addr'));
		$form->display('station.station_name', __('Station id'));
		$form->display('station.company.legal_name', __('Legal name'));
		$form->display('station.company.legal_mobile', __('Legal mobile'));

		$form->divider();
		$form->display('consume', '用气量数据(L)');
		$form->file('manage_file', '数据凭证')->readonly();
		$form->display('user_name', '上报人');
		$form->display('report_time', '上报时间');


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

