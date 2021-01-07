<?php

namespace App\Admin\Controllers;

use App\Models\StationExamStd;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class StationExamStdController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '考核明细';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new StationExamStd());
		$grid->disableCreateButton();
		$grid->disableActions();

        $grid->column('id', __('Id'));
        $grid->column('project', __('Project'));
        $grid->column('weight', __('Weight'));
        $grid->column('standard', __('Standard'));
        $grid->column('real_data', __('Real data'))->editable();
        $grid->column('result', __('Result'))->editable('select', ['不通过', '通过']);

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
        $show = new Show(StationExamStd::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('station_exam_id', __('Station exam id'));
        $show->field('standard_id', __('Standard id'));
        $show->field('project', __('Project'));
        $show->field('weight', __('Weight'));
        $show->field('standard', __('Standard'));
        $show->field('bonus', __('Bonus'));
        $show->field('real_data', __('Real data'));
        $show->field('result', __('Result'));
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
        $form = new Form(new StationExamStd());

        $form->number('station_exam_id', __('Station exam id'));
        $form->number('standard_id', __('Standard id'));
        $form->text('project', __('Project'));
        $form->number('weight', __('Weight'));
        $form->number('standard', __('Standard'));
        $form->number('bonus', __('Bonus'));
        $form->number('real_data', __('Real data'));
        $form->text('result', __('Result'));

        return $form;
    }
}
