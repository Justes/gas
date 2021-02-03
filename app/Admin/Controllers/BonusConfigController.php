<?php

namespace App\Admin\Controllers;

use App\Models\BonusConfig;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class BonusConfigController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '补贴标准设置';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new BonusConfig());

        $grid->column('id', __('Id'));
        $grid->column('discount_bonus', __('Discount bonus'));
        $grid->column('fair_bonus', __('Fair bonus'));
        $grid->column('warm_eve', __('Warm eve'));
        $grid->column('warm_price', __('Warm price'));
        $grid->column('warm_bonus', __('Warm bonus'));
        $grid->column('warm_limit', __('Warm limit'));
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
        $show = new Show(BonusConfig::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('discount_bonus', __('Discount bonus'));
        $show->field('fair_bonus', __('Fair bonus'));
        $show->field('warm_eve', __('Warm eve'));
        $show->field('warm_price', __('Warm price'));
        $show->field('warm_bonus', __('Warm bonus'));
        $show->field('warm_limit', __('Warm limit'));
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
        $form = new Form(new BonusConfig());

        $form->number('discount_bonus', __('Discount bonus'))->default(65);
        $form->number('fair_bonus', __('Fair bonus'))->default(65);
        $form->decimal('warm_eve', __('Warm eve'))->default(0.39);
        $form->decimal('warm_price', __('Warm price'))->default(2.61);
        $form->decimal('warm_bonus', __('Warm bonus'))->default(0.71);
        $form->number('warm_limit', __('Warm limit'))->default(820);

		$form->saved(function (Form $form) {
			return redirect('/admin/bonus-configs/' . $form->model()->id . '/edit');
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
