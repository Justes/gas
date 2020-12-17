<?php

namespace App\Admin\Controllers;

use App\Models\Organ;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class OrganController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '组织管理';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Organ());

        $grid->column('id', __('Id'));
        $grid->column('organ_name', __('Organ name'));

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
        $show = new Show(Organ::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('organ_name', __('Organ name'));
        $show->field('level', __('Level'));
        $show->field('pid', __('Pid'));
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
        $form = new Form(new Organ());

        $form->text('organ_name', __('Organ name'));
        $form->select('pid', __('Pid'))->options(Organ::all()->pluck('organ_name', 'id'));

        return $form;
    }
}
