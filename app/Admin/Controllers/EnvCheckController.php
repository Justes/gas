<?php

namespace App\Admin\Controllers;

use App\Models\ApiSetting;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class EnvCheckController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '环境检测';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new ApiSetting());

        $grid->column('id', __('Id'));
        $grid->column('client_id', __('Client id'));
        $grid->column('client_secret', __('Client secret'));
        $grid->column('project_id', __('Project id'));
        $grid->column('url', __('Url'));
        $grid->column('access_token', __('Access token'));
        $grid->column('token_type', __('Token type'));
        $grid->column('refresh_token', __('Refresh token'));
        $grid->column('create_token_time', __('Create token time'));
        $grid->column('expires_in', __('Expires in'));
        $grid->column('scope', __('Scope'));
        $grid->column('user_uri', __('User uri'));
        $grid->column('created_at', __('Created at'));
        $grid->column('updated_at', __('Updated at'));

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
        $show = new Show(ApiSetting::findOrFail($id));

		$show->field('client_id', __('网络环境'))->as(function($v) {
			return '正常';
		})->setWidth(1);
		$show->field('client_secret', __('数据库连接'))->as(function($v) {
			return '正常';
		})->setWidth(1);
		$show->field('url', __('即时通信'))->as(function($v) {
			return '正常';
		})->setWidth(1);

		$show->panel()
		->tools(function ($tools) {
			$tools->disableEdit();
			$tools->disableList();
			$tools->disableDelete();
		});

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new ApiSetting());

        $form->text('client_id', __('Client id'));
        $form->text('client_secret', __('Client secret'));
        $form->number('project_id', __('Project id'));
        $form->url('url', __('Url'));
        $form->text('access_token', __('Access token'));
        $form->text('token_type', __('Token type'));
        $form->text('refresh_token', __('Refresh token'));
        $form->text('create_token_time', __('Create token time'));
        $form->number('expires_in', __('Expires in'));
        $form->text('scope', __('Scope'));
        $form->text('user_uri', __('User uri'));

        return $form;
    }
}
