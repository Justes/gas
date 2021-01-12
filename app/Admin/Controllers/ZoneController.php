<?php

namespace App\Admin\Controllers;

use App\Models\{Zone, Station};
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class ZoneController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '区域';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Zone());
		$grid->model()->orderBy('id', 'desc');

		$grid->filter(function($filter) {
			$filter->disableIdFilter();
			$filter->like('zone_name', __('Zone name'));
			$filter->like('zone_range', __('Zone range'));
		});

        $grid->column('id', __('Id'));
        $grid->column('zone_name', __('Zone name'));
        $grid->column('zone_range', __('Zone range'));
		$grid->column('station_ids', __('Station ids'))->display(function($v) {
			$s = Station::whereIn('id', $v)->pluck('station_name')->toArray();
			return implode(',', $s);
		});
        //$grid->column('gas_type', __('Gas type'));
        $grid->column('tube_length', __('Tube length'));
        $grid->column('cover_area', __('Cover area'));
        $grid->column('population', __('Population'));
        $grid->column('zone_status_text', __('Zone status'));
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
        $show = new Show(Zone::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('zone_name', __('Zone name'));
        $show->field('zone_range', __('Zone range'));
		$show->field('station_ids', __('Station ids'))->as(function($v) {
			$s = Station::whereIn('id', $v)->pluck('station_name')->toArray();
			return implode(',', $s);
		});
        //$show->field('gas_type', __('Gas type'));
        $show->field('tube_length', __('Tube length'));
        $show->field('cover_area', __('Cover area'));
        $show->field('population', __('Population'));
        $show->field('zone_status_text', __('Zone status'));
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
        $form = new Form(new Zone());

        $form->text('zone_name', __('Zone name'))->rules('required');
        $form->text('zone_range', __('Zone range'))->rules('required');
        $form->multipleSelect('station_ids', __('Station ids'))->options(Station::all()->pluck('station_name', 'id'))->rules('required');
        //$form->select('gas_type', __('Gas type'))->options([1, 2, 3]);
        $form->number('tube_length', __('Tube length'))->min(0)->rules('required');
        $form->number('cover_area', __('Cover area'))->min(0)->rules('required');
        $form->number('population', __('Population'))->min(0)->rules('required');
        $form->radio('zone_status', __('Zone status'))->options(['可用', '禁用'])->default(0);

        return $form;
    }
}
