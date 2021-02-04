<?php

namespace App\Admin\Controllers;

use App\Models\{WarmSaleDetail, Station, Company};
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use App\Admin\Actions\WarmImport;

class WarmSaleDetailController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '自采暖上报明细';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new WarmSaleDetail());
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
        $grid->column('zones', __('Zones'));
        $grid->column('no', __('No'));
        $grid->column('username', __('Username'));
        $grid->column('first_num', __('First num'));
        $grid->column('first_date', __('First date'));
        $grid->column('second_num', __('Second num'));
        $grid->column('second_date', __('Second date'));
        $grid->column('gas_no', __('Gas no'));
		$grid->column('used_warm', __('Used warm'));
		$grid->column('bonus_warm', __('Bonus warm'));
		$grid->column('return_warm', __('Return warm'));
        $grid->column('bonus', __('Bonus'));
        $grid->column('reporter', __('Reporter'));
        $grid->column('report_time', __('Report time'));
        $grid->column('time_range', __('Time range'));
        $grid->column('remark', __('Remark'));

		$grid->tools(function (Grid\Tools $tools) {
			$tools->append(new WarmImport);
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
        $show = new Show(WarmSaleDetail::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('station_name', __('Station id'));
        $show->field('company_name', __('Company id'));
        $show->field('zones', __('Zones'));
        $show->field('no', __('No'));
        $show->field('username', __('Username'));
        $show->field('first_num', __('First num'));
        $show->field('first_date', __('First date'));
        $show->field('second_num', __('Second num'));
        $show->field('second_date', __('Second date'));
        $show->field('gas_no', __('Gas no'));
        $show->field('used_warm', __('Used warm'));
        $show->field('bonus', __('Bonus'));
        $show->field('year', __('Year'));
        $show->field('reporter', __('Reporter'));
        $show->field('report_time', __('Report time'));
        $show->field('time_range', __('Time range'));
        $show->field('remark', __('Remark'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new WarmSaleDetail());

		$form->select('station_id', __('Station id'))->options(Station::all()->pluck('station_name', 'id'));
        $form->select('company_id', __('Company id'))->options(Company::all()->pluck('company_name', 'id'))->readonly();
        $form->text('zones', __('Zones'));
        $form->text('no', __('No'));
        $form->text('username', __('Username'));
        $form->decimal('first_num', __('First num'))->default(0.00);
        $form->text('first_date', __('First date'));
        $form->decimal('second_num', __('Second num'))->default(0.00);
        $form->text('second_date', __('Second date'));
        $form->text('gas_no', __('Gas no'));
        $form->decimal('used_warm', __('Used warm'))->default(0.00);
        $form->number('bonus', __('Bonus'));
        $form->text('year', __('Year'));
        $form->text('reporter', __('Reporter'));
        $form->text('report_time', __('Report time'));
        $form->text('time_range', __('Time range'));
        $form->text('remark', __('Remark'));

        return $form;
    }
}
