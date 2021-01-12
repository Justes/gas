<?php

namespace App\Admin\Controllers;

use App\Models\CertPeriod;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class CertPeriodController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '经营许可证审核周期';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new CertPeriod());

        $grid->column('id', __('Id'));
        $grid->column('effect_type', __('Effect type'));
        $grid->column('created_at', __('Created at'));
        $grid->column('updated_at', __('Updated at'));

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
        $show = new Show(CertPeriod::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('effect_type', __('Effect type'));
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
        $form = new Form(new CertPeriod());

        $form->radio('effect_type', __('Effect type'))->options([1 => '一年一审', 2 => '两年一审']);

		$form->saved(function (Form $form) {
			return redirect('/admin/cert-periods/' . $form->model()->id . '/edit');
		});

		$form->tools(function(Form\Tools $tools) {
			$tools->disableDelete();
			$tools->disableList();
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
