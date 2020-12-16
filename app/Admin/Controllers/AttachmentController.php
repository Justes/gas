<?php

namespace App\Admin\Controllers;

use App\Models\Attachment;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class AttachmentController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '文件';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Attachment());
		$grid->model()->orderBy('id', 'desc');
		$grid->disableCreateButton();
		$grid->disableExport();
		$grid->disableColumnSelector();

		$grid->filter(function($filter) {
			$filter->disableIdFilter();
			$filter->like('path', '文件名');
		});

        $grid->column('id', __('Id'));
        $grid->column('file_name', __('File name'));
        $grid->column('file_ext', __('File ext'));
        $grid->column('post_user_name', __('Post user name'));
        $grid->column('article_title', __('Article title'));
        $grid->column('created_at', __('Created at'));

		$grid->actions(function ($actions) {
			$actions->disableDelete();
			$actions->disableEdit();
			$actions->disableView();

			$row = $actions->row;
			$actions->append('<a href="/pics/'.$row->path.'" target="_blank" download ><i class="fa fa-download">下载</i></a>');
			
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
        $show = new Show(Attachment::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('article_id', __('Article id'));
        $show->field('path', __('Path'));
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
        $form = new Form(new Attachment());

        $form->number('article_id', __('Article id'));
        $form->text('path', __('Path'));

        return $form;
    }
}
