<?php

namespace App\Admin\Controllers;

use App\Models\{BottleSaleLog, Company, Station, Zone};
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use App\Admin\Actions\BottleSaleImport;
use Encore\Admin\Widgets\Box;

class BottleSaleLogController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '换瓶站销量';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new BottleSaleLog());
		$grid->model()->orderBy('id', 'desc');
		$grid->disableCreateButton();
		$grid->disableColumnSelector();
		$grid->disablePagination();

		if(empty(request('sale_date'))) {
			$year = request()->sale_date = date('Y');
			$grid->model()->where('year', $year);
		}
		/*
		if(empty(request('sale_date'))) {
			$month = request()->sale_time = date('m');
			$grid->model()->where('month', $month);
		}
		 */

		$grid->filter(function($filter) {
			$filter->disableIdFilter();
			$filter->equal('station_id', __('场站名'))->select(Station::all()->pluck('station_name', 'id'));
			$filter->equal('company_id', __('公司名'))->select(Company::all()->pluck('company_name', 'id'));
			$filter->equal('zone_id', __('区域'))->select(Zone::all()->pluck('zone_name', 'id'));
			$filter->year('sale_date', '年')->default(date('Y'));
			//$filter->month('sale_time', '月')->default(date('m'));
		});

        $grid->column('id', __('Id'));
        $grid->column('station_name', __('Station id'));
        $grid->column('company_name', __('Company id'));
        $grid->column('sale_num', __('Bottle num'));
        $grid->column('bottle_num', __('Discount num'));
        $grid->column('volume', __('Fair num'));
		 $grid->column('time_range', __('Time range'));

		$grid->tools(function (Grid\Tools $tools) {
			$tools->append(new BottleSaleImport);
		});

		$grid->disableActions();

		$grid->header(function ($query) {
			$d = $query->get();
			$dates = $datas = $quarters = [];
			if($d->count()) {
				$datas = collect($d->toArray());
				$datas = $datas->sortBy('sale_date');

				for($i = 1; $i < 5; $i++) {
					$quarters[$i]['sale_num'] = $datas->where('quarter', $i)->sum('sale_num');
					$quarters[$i]['bottle_num'] = $datas->where('quarter', $i)->sum('bottle_num');
					$quarters[$i]['volume'] = $datas->where('quarter', $i)->sum('volume');
				}
			}

			$dates = $bottles = $volumes = $sales = [];
			foreach($datas as $item) {
				$dates[$item['sale_date']] = $item['sale_date'];
				$bottles[$item['sale_date']] = isset($bottles[$item['sale_date']]) ? $bottles[$item['sale_date']] + $item['bottle_num'] :  $item['bottle_num'];
				$volumes[$item['sale_date']] = isset($volumes[$item['sale_date']]) ? $volumes[$item['sale_date']] + $item['volume'] : $item['volume'];
				$sales[$item['sale_date']] = isset($sales[$item['sale_date']]) ? $sales[$item['sale_date']] + $item['sale_num'] : $item['sale_num'];
			}

			$cur = $last = $rate = ['bottle' => 0, 'volume' => 0, 'sale' => 0];

			foreach($bottles as $item) {
				$cur['bottle'] += $item;
			}

			foreach($volumes as $item) {
				$cur['volume'] += $item;
			}

			foreach($sales as $item) {
				$cur['sale'] += $item;
			}

			$year = request('sale_date') ?? date('Y');
			/*
			$month = request('sale_time') ?? date('m');
			if($month == 1) {
				$lastMonth = 12;
				$year--;
			} else {
				$lastMonth = $month - 1;
			}
			 */

			$where['year'] = $year;
			//$where['month'] = $lastMonth;

			if(request('zone_id')) {
				$where['zone_id'] = request('zone_id');
			}

			if(request('company_id')) {
				$where['company_id'] = request('company_id');
			}

			if(request('station_id')) {
				$where['station_id'] = request('station_id');
			}

			/*
			$lastLogs = BottleSaleLog::where($where)->get();
			foreach($lastLogs as $item) {
				$last['bottle'] += $item->bottle_num;
				$last['volume'] += $item->volume;
				$last['sale'] += $item->sale_num;
			}
			 */


			/*
			foreach($last as $key => $item) {
				if($item != 0) {
					$rate[$key] = ceil(($cur[$key] / $item) * 100);
				}
			}
			 */

			$doughnut = view('admin.sale-stat', compact('quarters', 'dates', 'bottles', 'volumes', 'sales'));
			return new Box('销量统计', $doughnut);
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
        $show = new Show(BottleSaleLog::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('station_id', __('Station id'));
        $show->field('company_id', __('Company id'));
        $show->field('bottle_num', __('Bottle num'));
        $show->field('volume', __('Volume'));
        $show->field('sale_num', __('Sale num'));
        $show->field('sale_date', __('Sale date'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new BottleSaleLog());

        $form->number('station_id', __('Station id'));
        $form->number('company_id', __('Company id'));
        $form->number('bottle_num', __('Bottle num'));
        $form->number('volume', __('Volume'));
        $form->number('sale_num', __('Sale num'));
        $form->text('sale_date', __('Sale date'));

        return $form;
    }
}
