<?php

namespace App\Admin\Controllers;

use App\Models\{GasStat, Company};
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class GasStatController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '企业用气量';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new GasStat());
		$grid->model()->orderBy('id', 'desc');

        $grid->column('id', __('Id'));
        $grid->column('year', __('Year'));
        $grid->column('company_name', __('Company id'));
        $grid->column('used_gas', __('Used gas'));

		$grid->filter(function($filter) {
			$filter->disableIdFilter();
			$filter->equal('company_id', __('公司名'))->select(Company::all()->pluck('company_name', 'id'));
		});

		$grid->actions(function ($actions) {
			$actions->disableView();
			$actions->disableEdit();
			$actions->disableDelete();

			$row = $actions->row;
			// append一个操作
			//$actions->prepend('<a href="/admin/gas-used-details?company_id='.$row['company_id'].'"><i class="fa fa-line-chart">用气量监控</i></a>');
			$actions->prepend('<a href="/admin/gas-exams?company_id='.$row['company_id'].'&year='.$row['year'].'"><i class="fa fa-line-chart">用气量监控</i></a>');
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
        $show = new Show(GasStat::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('year', __('Year'));
        $show->field('company_name', __('Company name'));
        $show->field('used_gas', __('Used gas'));
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
        $form = new Form(new GasStat());

        $form->text('year', __('Year'));
        $form->select('company_id', __('Company id'))->options(Company::all()->pluck('company_name', 'id'));
        $form->number('used_gas', __('Used gas'));

        return $form;
    }
}
