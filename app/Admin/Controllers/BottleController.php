<?php

namespace App\Admin\Controllers;

use App\Models\{Bottle, Station};
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class BottleController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '钢瓶流转记录';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Bottle());
		$grid->model()->orderBy('id', 'desc');

		$grid->filter(function($filter) {
			$filter->disableIdFilter();
			$filter->equal('bottle_no', __('Bottle no'));
		});

        $grid->column('id', __('Id'));
        $grid->column('bottle_no', __('Bottle no'));
        $grid->column('station_id', __('Station id'));
        $grid->column('volume', __('Volume'));
        $grid->column('guest', __('Guest'));
        $grid->column('flow_time', __('Flow time'));
        $grid->column('status_text', __('Status'));

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
        $show = new Show(Bottle::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('bottle_no', __('Bottle no'));
        $show->field('station_name', __('Station id'));
        $show->field('volume', __('Volume'));
        $show->field('guest', __('Guest'));
        $show->field('flow_time', __('Flow time'));
        $show->field('status_text', __('Status'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Bottle());

        $form->text('bottle_no', __('Bottle no'));
        $form->select('station_id', __('Station id'))->options(Station::all()->pluck('station_name', 'id'));
        $form->number('volume', __('Volume'));
        $form->text('guest', __('Guest'));
        $form->datetime('flow_time', __('Flow time'));
        $form->radio('status', __('Status'))->options(['正常', '异常']);

        return $form;
    }
}
