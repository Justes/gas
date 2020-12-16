<?php

namespace App\Admin\Controllers;

use App\Models\Category;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class CategoryController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '类型';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Category());
		$grid->model()->orderBy('id', 'desc');

		$grid->filter(function($filter) {
			$filter->disableIdFilter();
			$filter->like('cate_name', '类型');
		});

        $grid->column('id', __('Id'));
        $grid->column('cate_name', __('Cate name'));

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
        $show = new Show(Category::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('cate_name', __('Cate name'));
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
        $form = new Form(new Category());

        $form->text('cate_name', __('Cate name'));

        return $form;
    }
}
