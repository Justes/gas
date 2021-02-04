<?php

namespace App\Admin\Controllers;

use App\Models\{ExpireTip, Station};
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class FireTipController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '消防有效期提醒';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new ExpireTip());
		$grid->model()->where('std_type', 5);

        $grid->column('id', __('Id'));
        $grid->column('trigger_time', __('Trigger time'));
		$grid->column('station_ids', __('Station ids'))->display(function($v) {
			$s = Station::whereIn('id', $v)->pluck('station_name')->toArray();
			return implode(',', $s);
		});
        $grid->column('remark', __('Remark'));
        $grid->column('created_at', __('Created at'));

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
        $show = new Show(ExpireTip::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('trigger_time', __('Trigger time'));
		$show->field('station_ids', __('Station ids'))->as(function($v) {
			$stn = Station::whereIn('id', $v)->pluck('station_name')->toArray();
			return implode(',', $stn);
		});
        $show->field('remark', __('Remark'));
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
        $form = new Form(new ExpireTip());

        $form->datetime('trigger_time', __('Trigger time'))->rules('required');
        $form->multipleSelect('station_ids', __('Station ids'))->options(Station::all()->pluck('station_name', 'id'))->rules('required');
        $form->text('remark', __('Remark'))->rules('required');
        $form->hidden('std_type', __('Std type'))->default(5);

        return $form;
    }
}
