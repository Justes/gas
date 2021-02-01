<?php

namespace App\Admin\Controllers;

use App\Models\Intfc;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class IntfcContrller extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '平台接入管理';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Intfc());
		$grid->model()->orderBy('id', 'desc');

		$grid->filter(function($filter) {
			$filter->disableIdFilter();
			$filter->like('plt_name', __('平台名'));
		});

        $grid->column('id', __('Id'));
        $grid->column('plt_name', __('Plt name'));
        $grid->column('plt_desc', __('Plt desc'));
		$grid->column('create_date', __('Create date'));
        $grid->column('status', __('Status'))->display(function($v) {
			$arr = ['开发中', '成功'];
			return $arr[$v];
		})->label('success');

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
        $show = new Show(Intfc::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('plt_name', __('Plt name'));
        $show->field('plt_desc', __('Plt desc'));
        $show->field('create_date', __('Create date'));
        $show->field('status', __('Status'));
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
        $form = new Form(new Intfc());

        $form->text('plt_name', __('Plt name'));
        $form->text('plt_desc', __('Plt desc'));
        $form->date('create_date', __('Create date'));
        $form->radio('status', __('Status'))->options(['开发中', '成功'])->default(1);

        return $form;
    }
}
