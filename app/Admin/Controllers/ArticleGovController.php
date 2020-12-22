<?php

namespace App\Admin\Controllers;

use App\Models\{Article, Category, AdminUser};
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Illuminate\Support\Facades\Auth;

class ArticleGovController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '政策法规';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Article());
		$grid->model()->where('article_type', 2)->orderBy('id', 'desc');

		$grid->filter(function($filter) {
			$filter->disableIdFilter();
			$filter->like('title', '标题');
		});


        $grid->column('id', __('Id'));
        $grid->column('title', __('Title'));
		$grid->column('post_user_name', __('Post user name'));
		$grid->column('cate_name', __('Cate name'));
        $grid->column('send_time', __('Send time'));
        $grid->column('post_status_text', __('Post status'));

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
        $show->field('cate_name', __('Cate name'));
        $show->field('content', __('Content'))->ckeditor();
        $show->field('effect_type_text', __('Effect type'));
        $show->field('effect_days', __('Effect days'));
        $show->field('send_type_text', __('Send type'));
        $show->field('send_time', __('Send time'));
        $show->field('receive_type_text', __('Receive type'));
		$show->field('receive_user_ids', __('Receive user ids'))->as(function($v) {
			$u = AdminUser::whereIn('id', $v)->pluck('name')->toArray();
			return implode(',', $u);
		});
        $show->field('attaches', __('Attaches'));
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
        $form = new Form(new Article());

        $form->text('title', __('Title'))->rules('required');
        $form->select('cate_id', __('Cate name'))->options(Category::all()->pluck('cate_name', 'id'))->default(1);
		$form->hidden('article_type', __('Article type'))->default(2);
        $form->ckeditor('content', __('Content'))->rules('required');
        $form->radio('effect_type', __('Effect type'))->options(['永久', '限时']);
        $form->number('effect_days', __('Effect days'))->default(0);
        $form->radio('send_type', __('Send type'))->options(['立即', '定时']);
        $form->datetime('send_time', __('Send time'));
        $form->radio('receive_type', __('Receive type'))->options(['所有人', '指定人']);
        $form->multipleSelect('receive_user_ids', __('Receive user ids'))->options(AdminUser::all()->pluck('name', 'id'));
        $form->multipleFile('attachments', __('Attaches'))->pathColumn('path')->removable()->disk('admin');
		$form->hidden('post_user_id');
		$form->hidden('post_status');
		$form->saving(function (Form $form) {
			if(isset($form->model()->send_type)) {
				$form->post_status = $form->model()->send_type;
			} else {
				$form->post_status = $form->send_type;
				if($form->send_type == 0) {
					$form->send_time = date("Y-m-d H:i:s");
				}
			}
			$form->post_user_id = Auth::id();
        });

        return $form;
    }
}

