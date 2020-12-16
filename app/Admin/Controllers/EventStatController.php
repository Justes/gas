<?php

namespace App\Admin\Controllers;

use App\Models\{Event, Station, EventType};
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Encore\Admin\Widgets\Box;
use Illuminate\Support\Facades\DB;

class EventStatController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '事件统计';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {

        $grid = new Grid(new Event());
		if(empty(request('created_at'))) {
			$year = request()->created_year = date('Y');
			$grid->model()->where('created_year', $year);
		}
		if(empty(request('created_at'))) {
			$month = request()->created_month = date('m');
			$grid->model()->where('created_month', $month);
		}

		$grid->model()->orderBy('id', 'desc');
		$grid->disableCreateButton();
		$grid->disableExport();
		$grid->disableColumnSelector();

		$grid->filter(function($filter) {
			$filter->disableIdFilter();
			$filter->equal('station_id', __('Station id'))->select(Station::all()->pluck('station_name', 'id'));
			$filter->equal('event_type_id', __('Event type'))->select(EventType::all()->pluck('etype_name', 'id'));
			$filter->equal('event_status', __('Event status'))->select(['未解决', '已解决']);
			$filter->year('created_date', '年')->default(date('Y'));
			$filter->month('created_at', '月')->default(date('m'));
		});

        $grid->column('id', __('Id'));
        $grid->column('event_name', __('Event name'));
        $grid->column('event_type_text', __('Event type name'));
        $grid->column('station_name', __('Station id'));
        $grid->column('admin_user_name', __('Admin user id'));
        $grid->column('event_status_text', __('Event status'));
        $grid->column('solve_time_text', __('Solved at'));
        $grid->column('created_at', __('Created at'));


		$grid->header(function ($query) {
			$d = $query->get();

			$stat['all'] = $d->count();
			$stat['solved'] = $d->where('event_status', 1)->count();
			$stat['unsolved'] = $d->where('event_status', 0)->count();

			$cntArr = [];
			$bar = [];
			foreach($d as $item) {
				if(isset($cntArr[$item->event_type_id])) {
					$cntArr[$item->event_type_id]++;
				} else {
					$cntArr[$item->event_type_id] = 1;
				}

				if($item->solved_minutes) {
					if(isset($bar[$item->created_day])) {
						$bar[$item->created_day] += $item->solved_minutes;
					} else {
						$bar[$item->created_day] = $item->solved_minutes;
					}
				}
			}

			//$arr = $query->select(DB::raw('count(event_status) as count, event_status'))
				//->groupBy('event_status')->get()->pluck('count', 'event_status')->toArray();

			//$stat['solved'] = $arr[1] ?? 0;
			//$stat['unsolved'] = $arr[0] ?? 0;

			/*
			$cntArr = $query->select(DB::raw('count(event_type_id) as count, event_type_id'))
				->groupBy('event_type_id')->get()->pluck('count', 'event_type_id')->toArray();

			 */

			$types = EventType::all()->pluck('etype_name', 'id');
			$data = [];

			foreach($types as $key => $item) {
				$data[$item] = $cntArr[$key];
			}

			ksort($bar);

			$doughnut = view('admin.event-stat', compact('stat', 'data', 'bar'));
			return new Box('事件统计', $doughnut);
		});

		$grid->actions(function ($actions) {
			$actions->disableEdit();
			$actions->disableDelete();
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

        $form->text('event_name', __('Event name'));
        $form->switch('event_type_id', __('Event type id'));
        $form->number('station_id', __('Station id'));
        $form->number('admin_user_id', __('Admin user id'));
        $form->switch('event_status', __('Event status'));
        $form->text('deal_content', __('Deal content'));
        $form->text('solved_time', __('Solved time'));

        return $form;
    }
}
