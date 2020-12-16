<?php

namespace App\Admin\Controllers;

use App\Models\Standard;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class BottleStdController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '补贴标准';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Standard());

        $grid->column('id', __('Id'));
        $grid->column('project', __('Project'));
        $grid->column('weight', __('Weight'));
        $grid->column('standard', __('Standard'));
        $grid->column('bonus', __('Bonus'));
		$grid->disableFilter();

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
        $show->field('bonus', __('Bonus'));

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
        $form->number('bonus', __('Bonus'));

        return $form;
    }
}
