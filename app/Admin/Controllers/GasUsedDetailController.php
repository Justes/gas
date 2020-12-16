<?php

namespace App\Admin\Controllers;

use App\Models\{GasUsedDetail, Company};
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Encore\Admin\Widgets\Box;

class GasUsedDetailController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '用气量监控';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new GasUsedDetail());

		if(empty(request('created_at'))) {
			$year = request()->created_year = date('Y');
			$grid->model()->where('created_year', $year);
		}
		if(empty(request('created_at'))) {
			$month = request()->created_month = date('m');
			$grid->model()->where('created_month', $month);
		}

		$grid->model()->orderBy('id', 'desc');
		//$grid->disableCreateButton();
		$grid->disableExport();
		$grid->disableColumnSelector();

		$grid->filter(function($filter) {
			$filter->disableIdFilter();
			$filter->equal('company_id', __('Company id'))->select(Company::all()->pluck('company_name', 'id'));
			$filter->year('created_date', '年')->default(date('Y'));
			$filter->month('created_at', '月')->default(date('m'));
		});

        $grid->column('id', __('Id'));
        $grid->column('company_name', __('Company name'));
        $grid->column('used_gas', __('Used gas'));
        $grid->column('report_user_name', __('Report user name'));
        $grid->column('report_time', __('Report time'));

		$grid->header(function ($query) {
			$d = $query->get();

			$cur = $d->sum('used_gas');
			$rate = $last = 0;
			$comName = '';

			$year = request('created_date') ?? date('Y');
			$month = request('created_at') ?? date('m');
			if($month == 1) {
				$lastMonth = 12;
				$year = $year--;
			} else {
				$lastMonth = $month - 1;
			}

			if(request('company_id')) {

				$last = GasUsedDetail::where(['company_id' => request('company_id'), 'created_year' => $year, 'created_month' => $lastMonth])->get()->sum('used_gas');
				$com = Company::find(request('company_id'));
				$comName = $com->company_name ?? '';
			} else {
				$last = GasUsedDetail::where(['created_year' => $year, 'created_month' => $lastMonth])->get()->sum('used_gas');
			}

			if($cur != 0) {
				$rate = number_format((($cur - $last) / $cur) * 100, 2, '.', '') . '%';
			}

			$bar = $d->pluck('used_gas', 'created_day')->toArray() ?? [];
			ksort($bar);

			$doughnut = view('admin.gas-used-detail', compact('comName', 'cur', 'last', 'rate', 'bar'));
			return new Box('用气量', $doughnut);
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
        $show = new Show(GasUsedDetail::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('company_name', __('Company id'));
        $show->field('data_pic', __('Data pic'))->image();
        $show->field('report_user_name', __('Report user name'));
        $show->field('report_time', __('Report time'));
        $show->field('used_gas', __('Used gas'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new GasUsedDetail());

        $form->select('company_id', __('Company id'))->options(Company::all()->pluck('company_name', 'id'));
		$form->image('data_pic', __('Data pic'))->disk('admin')->uniqueName();
        $form->text('report_user_name', __('Report user name'));
        $form->text('report_time', __('Report time'));
        $form->decimal('used_gas', __('Used gas'))->default(0.00);

        return $form;
    }
}
