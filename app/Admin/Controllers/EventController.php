<?php

namespace App\Admin\Controllers;

use App\Models\{Event, EventType, Station, AdminUser};
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use App\Admin\Extensions\CheckRow;

class EventController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '事件';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Event());
		$grid->model()->orderBy('id', 'desc');
		$grid->disableRowSelector();

		$grid->filter(function($filter) {
			$filter->disableIdFilter();
			$filter->like('event_name', __('Event name'));
			$filter->equal('station_id', __('Station id'))->select(Station::all()->pluck('station_name', 'id'));
			$filter->equal('event_type_id', __('Event type'))->select(EventType::all()->pluck('etype_name', 'id'));
			$filter->equal('event_status', __('Event status'))->select(['未解决', '已解决']);
		});

        $grid->column('id', __('Id'));
        $grid->column('event_name', __('Event name'));
        $grid->column('event_type_text', __('Event type name'));
        $grid->column('station_name', __('Station id'));
        $grid->column('admin_user_name', __('Admin user id'));
        $grid->column('event_status_text', __('Event status'));
        $grid->column('solve_time_text', __('Solved at'));
        $grid->column('created_at', __('Created at'));

		$grid->actions(function ($actions) {
			$actions->disableDelete();

			$row = $actions->row;
			// append一个操作
			if(empty($row['event_status'])) {
				$actions->append(new CheckRow($actions->getKey()));
				//$actions->append('<a href="/admin/stations/'.$row['id'].'/edit"><i class="fa fa-bolt" style="padding-right:10px;">催办</i></a>');
			}
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
        $show = new Show(Event::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('event_name', __('Event name'));
        $show->field('event_type_text', __('Event type id'));
        $show->field('station_name', __('Station id'));
        $show->field('admin_user_name', __('Admin user id'));
        $show->field('event_status_text', __('Event status'));
        $show->field('deal_content', __('Deal content'));
        $show->field('solve_time_text', __('Solved at'));
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
        $form = new Form(new Event());
		$form->tools(function(Form\Tools $tools) {
			$tools->disableDelete();
		});

		if($form->isCreating()) {
			$form->text('event_name', __('Event name'))->rules('required');
			$form->select('event_type_id', __('Event type id'))->options(EventType::all()->pluck('etype_name', 'id'))->rules('required');
			$form->select('station_id', __('Station id'))->options(Station::all()->pluck('station_name', 'id'))->rules('required');
			$form->select('admin_user_id', __('Admin user id'))->options(AdminUser::where('type',1)->pluck('name', 'id'))->rules('required');
			$form->radio('event_status', __('Event status'))->options(['未解决', '已解决']);
			$form->textarea('deal_content', __('Deal content'));
			$form->hidden('created_year')->default(date('Y'));
			$form->hidden('created_month')->default(date('m'));
			$form->hidden('created_date')->default(date('Y-m-d H:i:s'));
			$form->hidden('created_day')->default(date('Y-m-d'));
		} else {
			$form->display('event_name', __('Event name'));
			$form->display('event_type_text', __('Event type id'));
			$form->display('station_name', __('Station id'));
			$form->display('admin_user_name', __('Admin user id'));
			$form->radio('event_status', __('Event status'))->options(['未解决', '已解决']);
			$form->textarea('deal_content', __('Deal content'));
			$form->display('solve_time_text', __('Solved at'));
			$form->hidden('solved_time');
			$form->hidden('solved_at');
			$form->hidden('solved_minutes');
			$form->hidden('created_year');
			$form->hidden('created_month');

			$form->saving(function (Form $form) {
				if($form->event_status == 1 && $form->model()->event_status != 1) {
					$form->solved_time = time();
					$form->solved_minutes = intval(($form->solved_time - strtotime($form->model()->created_at)) / 60);
					$form->solved_at = date('Y-m-d H:i:s');
				}
			});
		}

        return $form;
    }
}
