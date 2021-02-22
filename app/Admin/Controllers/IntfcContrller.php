<?php

namespace App\Admin\Controllers;

use App\Models\{Intfc, ApiSetting};
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use App\Admin\Extensions\{IntfcCheck, AuthCheck};

class IntfcContrller extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '平台接入管理';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Intfc());
		$grid->model()->orderBy('id', 'desc');

		$grid->filter(function($filter) {
			$filter->disableIdFilter();
			$filter->like('plt_name', __('平台名'));
		});

        $grid->column('id', __('Id'));
        $grid->column('plt_name', __('Plt name'));
        $grid->column('plt_desc', __('Plt desc'));
		$grid->column('create_date', __('Create date'));
        $grid->column('status', __('Status'))->display(function($v) {
			$arr = ['开发中', '成功'];
			return $arr[$v];
		})->label('success');

		$grid->actions(function ($actions) {
			$row = $actions->row;
			// append一个操作
			
			//$actions->prepend('<a href="/admin/devices?station_id='.$row['id'].'"><i class="fa fa-align-left" style="padding-right:10px;">访问日志</i></a>');
			//$actions->prepend('<a href="/admin/workers?station_id='.$row['id'].'"><i class="fa fa-user" style="padding-right:10px;">授权管理</i></a>');
			$actions->append(new IntfcCheck($actions->getKey()));
			$actions->append(new AuthCheck($actions->getKey()));
			$actions->append('<a href="/admin/intfc-logs"><i class="btn btn-xs btn-primary fa fa-align-left" style="padding-right:10px;">访问日志</i></a>');
			//$actions->prepend('<a href="/admin/stations/'.$row['id'].'/edit"><i class="fa fa-link" style="padding-right:10px;">接入检测</i></a>');
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
        $show = new Show(Intfc::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('plt_name', __('Plt name'));
        $show->field('plt_desc', __('Plt desc'));
        $show->field('create_date', __('Create date'));
        $show->field('status', __('Status'));
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
        $form = new Form(new Intfc());

        $form->text('plt_name', __('Plt name'));
        $form->text('plt_desc', __('Plt desc'));
        $form->date('create_date', __('Create date'));
        $form->radio('status', __('Status'))->options(['开发中', '成功'])->default(1);

		$api = ApiSetting::first();
		$form->text('client_id', __('授权id'))->default($api->client_id)->rules('required');
		$form->text('client_secret', __('授权密钥'))->default($api->client_secret)->rules('required');
		$form->text('project_id', __('平台id'))->default($api->project_id)->rules('required');

		$form->saving(function(Form $form) {
			$data = [];
			if($form->client_id) {
				$data['client_id'] = $form->client_id;
			}

			if($form->client_secret) {
				$data['client_secret'] = $form->client_secret;
			}

			if($form->project_id) {
				$data['project_id'] = $form->project_id;
			}

			if(!empty($data)) {
				ApiSetting::where('id', 1)->update($data);
			}
		});

        return $form;
    }
}
