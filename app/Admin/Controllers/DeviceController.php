<?php

namespace App\Admin\Controllers;

use App\Models\{Device, Station, AdminUser};
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class DeviceController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '设备';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Device());
		$grid->model()->orderBy('id', 'desc');

		$grid->filter(function($filter) {
			$filter->disableIdFilter();
			$filter->equal('device_no', __('Device no'));
			$filter->equal('station_id', '场站')->select(Station::all()->pluck('station_name', 'id'));
			$filter->equal('device_status', __('Device status'))->select(['正常', '维修中', '已报废']);
		});

        $grid->column('id', __('Id'));
        $grid->column('station_name', __('Station name'));
        $grid->column('device_no', __('Device no'));
        $grid->column('device_name', __('Device name'));
        $grid->column('device_type', __('Device type'));
        $grid->column('admin_user_name', __('Admin user name'));
        $grid->column('device_status_text', __('Device status'));
        $grid->column('fix_logs', __('Fix logs'));
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
        $show = new Show(Device::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('station_id', __('Station id'));
        $show->field('device_no', __('Device no'));
        $show->field('device_name', __('Device name'));
        $show->field('device_type', __('Device type'));
        $show->field('admin_user_name', __('Admin user name'));
        $show->field('device_status_text', __('Device status'));
        $show->field('device_pic', __('Device pic'))->image();
        $show->field('fix_logs', __('Fix logs'));
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
        $form = new Form(new Device());

        $form->select('station_id', __('Station id'))->options(Station::all()->pluck('station_name', 'id'))->rules('required');
        $form->text('device_no', __('Device no'))->rules('required');;
        $form->text('device_name', __('Device name'))->rules('required');;
        $form->text('device_type', __('Device type'))->rules('required');;
        $form->select('admin_user_id', __('Admin user id'))->options(AdminUser::where('type', 1)->get()->pluck('name', 'id'))->rules('required');;
        $form->select('device_status', __('Device status'))->options(['正常', '维修中', '报废'])->default(0);
        $form->image('device_pic', __('Device pic'))->disk('admin')->uniqueName();
        $form->textarea('fix_logs', __('Fix logs'));

        return $form;
    }
}
