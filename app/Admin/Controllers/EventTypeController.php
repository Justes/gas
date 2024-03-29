<?php

namespace App\Admin\Controllers;

use App\Models\EventType;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class EventTypeController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '事件时限';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new EventType());
		$grid->model()->where('id', '<>', 5);
		$grid->disableFilter();
		$grid->disableCreateButton();
		$grid->disableExport();
		$grid->disableColumnSelector();
		$grid->disableRowSelector();

        $grid->column('id', __('Id'));
        $grid->column('etype_name', __('Etype name'));
        $grid->column('deal_time', __('Deal time'));

		$grid->actions(function ($actions) {
			$actions->disableDelete();
			$actions->disableView();
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
        $show = new Show(EventType::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('etype_name', __('Etype name'));
        $show->field('deal_time', __('Deal time'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new EventType());

        $form->text('etype_name', __('Etype name'));
        $form->time('deal_time', __('Deal time'))->format('HH:mm');

        return $form;
    }
}
