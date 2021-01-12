<?php

namespace App\Admin\Controllers;

use App\Models\Standard;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class EvalStdController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '综合评价标准';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Standard());
		$grid->model()->where('std_type', 9);
		$grid->disableFilter();

        $grid->column('id', __('Id'));
        $grid->column('project', __('Project'));
        $grid->column('weight', __('Weight'));
        $grid->column('standard', __('Standard'));

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
        $show = new Show(Standard::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('project', __('Project'));
        $show->field('weight', __('Weight'));
        $show->field('standard', __('Standard'));
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
        $form = new Form(new Standard());

        $form->text('project', __('Project'));
        $form->number('weight', __('Weight'));
        $form->number('standard', __('Standard'));
        $form->hidden('std_type', __('Std type'))->default(9);

        return $form;
    }
}


