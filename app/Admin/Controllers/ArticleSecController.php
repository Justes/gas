<?php

namespace App\Admin\Controllers;

use App\Models\Article;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class ArticleSecController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '安全教育';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Article());
		$grid->model()->orderBy('id', 'desc');

		$grid->filter(function($filter) {
			$filter->disableIdFilter();
			$filter->like('title', '标题');
		});


        $grid->column('id', __('Id'));
        $grid->column('title', __('Title'));
        $grid->column('effect_type_text', __('Effect type'));
        $grid->column('effect_days', __('Effect days'));
        $grid->column('send_type_text', __('Send type'));
        $grid->column('send_time', __('Send time'));
        $grid->column('receive_type_text', __('Receive type'));
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
        $show = new Show(Article::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('title', __('Title'));
        $show->field('article_type', __('Article type'));
        $show->field('cate_id', __('Cate id'));
        $show->field('content', __('Content'));
        $show->field('effect_type', __('Effect type'));
        $show->field('effect_days', __('Effect days'));
        $show->field('send_type', __('Send type'));
        $show->field('send_time', __('Send time'));
        $show->field('receive_type', __('Receive type'));
        $show->field('receive_user_ids', __('Receive user ids'));
        $show->field('attaches', __('Attaches'));
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
        $form = new Form(new Article());

        $form->text('title', __('Title'));
        $form->switch('article_type', __('Article type'));
        $form->switch('cate_id', __('Cate id'));
        $form->textarea('content', __('Content'));
        $form->switch('effect_type', __('Effect type'));
        $form->number('effect_days', __('Effect days'));
        $form->switch('send_type', __('Send type'));
        $form->text('send_time', __('Send time'));
        $form->switch('receive_type', __('Receive type'));
        $form->text('receive_user_ids', __('Receive user ids'));
        $form->text('attaches', __('Attaches'));

        return $form;
    }
}
