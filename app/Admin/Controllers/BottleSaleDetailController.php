<?php

namespace App\Admin\Controllers;

use App\Models\{BottleSaleDetail, Station, Company};
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use App\Admin\Actions\BottleImport;

class BottleSaleDetailController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '销量上报明细';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new BottleSaleDetail());
		$grid->model()->orderBy('id', 'desc');

		$grid->filter(function($filter) {
			$filter->disableIdFilter();
			$filter->equal('station_id', __('场站名'))->select(Station::all()->pluck('station_name', 'id'));
			$filter->equal('company_id', __('公司名'))->select(Company::all()->pluck('company_name', 'id'));
		});

		$grid->disableCreateButton();

        $grid->column('id', __('Id'));
        $grid->column('year', __('Year'));
        $grid->column('station_name', __('Station id'));
        $grid->column('company_name', __('Company id'));
        $grid->column('zones', __('Zone id'));
        $grid->column('discount_num', __('Discount num'));
        $grid->column('fair_num', __('Fair num'));
        $grid->column('sale_num', __('Bottle num'));
        $grid->column('bonus', __('Bonus'));
        $grid->column('reporter', __('Reporter'));
        $grid->column('report_time', __('Report time'));
        $grid->column('time_range', __('Time range'));
        $grid->column('remark', __('Remark'));
        $grid->column('created_at', __('Created at'));

		$grid->tools(function (Grid\Tools $tools) {
			$tools->append(new BottleImport);
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
        $show = new Show(BottleSaleDetail::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('station_name', __('Station id'));
        $show->field('company_name', __('Company id'));
        $show->field('zones', __('Zone id'));
        $show->field('discount_num', __('Discount num'));
        $show->field('fair_num', __('Fair num'));
        $show->field('sale_num', __('Bottle num'));
        $show->field('bonus', __('Bonus'));
        $show->field('year', __('Year'));
        $show->field('reporter', __('Reporter'));
        $show->field('report_time', __('Report time'));
        $show->field('time_range', __('Time range'));
        $show->field('remark', __('Remark'));
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
        $form = new Form(new BottleSaleDetail());

        $form->select('station_id', __('Station id'))->options(Station::all()->pluck('station_name', 'id'));
        $form->select('company_id', __('Company id'))->options(Company::all()->pluck('company_name', 'id'))->readonly();
        $form->text('zones', __('Zone id'));
        $form->number('discount_num', __('Discount num'));
        $form->number('fair_num', __('Fair num'));
        $form->number('sale_num', __('Bottle num'));
        $form->number('bonus', __('Bonus'));
        $form->text('year', __('Year'));
        $form->text('reporter', __('Reporter'));
        $form->text('report_time', __('Report time'));
        $form->text('time_range', __('Time range'));
        $form->text('remark', __('Remark'));

        return $form;
    }
}
