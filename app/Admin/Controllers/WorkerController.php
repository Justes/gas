<?php

namespace App\Admin\Controllers;

use App\Models\{AdminUser, Station};
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use App\Admin\Actions\Refresh;

class WorkerController extends AdminController
{
    /**
     * {@inheritdoc}
     */
    protected function title()
    {
        return '工作人员';
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $userModel = config('admin.database.users_model');

        $grid = new Grid(new $userModel());
		$grid->model()->where('type', 1)->orderBy('id', 'desc');

		$grid->filter(function($filter) {
			$filter->disableIdFilter();
			$filter->equal('station_id', '站点')->select(Station::all()->pluck('station_name', 'id'));
		});

        $grid->column('id', '编号')->sortable();
        $grid->column('username', trans('admin.username'));
        $grid->column('name', '姓名');
		$grid->column('station_id', '所属站点')->display(function($v) {
			$st = Station::find($v);
			return $st->station_name ?? '';
		});
		$grid->column('gender', '性别')->display(function($v) {
			$arr = ['女', '男'];
			return $arr[$v];
		});
        $grid->column('mobile', '联系电话');
		$grid->column('roles', '职务')->display(function($v) {
			return $v[0]['name'] ?? '';
		});
        $grid->column('job_desc', '工作职责');

        $grid->actions(function (Grid\Displayers\Actions $actions) {
            if ($actions->getKey() == 1) {
                $actions->disableDelete();
            }
        });

        $grid->tools(function (Grid\Tools $tools) {
            $tools->batch(function (Grid\Tools\BatchActions $actions) {
                $actions->disableDelete();
            });

			$tools->append(new Refresh);
        });

        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     *
     * @return Show
     */
    protected function detail($id)
    {
        $userModel = config('admin.database.users_model');

        $show = new Show($userModel::findOrFail($id));

        $show->field('id', 'ID');
        $show->field('username', trans('admin.username'));
        $show->field('name', trans('admin.name'));
		$show->field('station_id', '所属站点')->as(function($v) {
			$st = Station::find($v);
			return $st->station_name ?? '';
		});
		$show->field('gender', '性别')->as(function($v) {
			$arr = ['女', '男'];
			return $arr[$v];
		});
		$show->field('age', '年龄');
	    $show->field('mobile', '联系电话');
        $show->field('job_desc', '工作职责');

        $show->field('roles', trans('admin.roles'))->as(function ($roles) {
            return $roles->pluck('name');
        })->label();
		/*
        $show->field('permissions', trans('admin.permissions'))->as(function ($permission) {
            return $permission->pluck('name');
        })->label();
		 */
		$show->field('created_at', __('Created at'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    public function form()
    {
        $userModel = config('admin.database.users_model');
        $permissionModel = config('admin.database.permissions_model');
        $roleModel = config('admin.database.roles_model');

        $form = new Form(new $userModel());

        $userTable = config('admin.database.users_table');
        $connection = config('admin.database.connection');

        $form->text('username', trans('admin.username'))
            ->creationRules(['required', "unique:{$connection}.{$userTable}"])
            ->updateRules(['required', "unique:{$connection}.{$userTable},username,{{id}}"]);

        $form->text('name', '姓名')->rules('required');
        $form->select('station_id', '站点')->options(Station::all()->pluck('station_name', 'id'));
		$form->radio('gender', '性别')->options([1 => '男', 0 => '女'])->default(1);
		$form->number('age', '年龄')->min(0);
        $form->text('mobile', '电话')->rules('required');
        $form->multipleSelect('roles', '职务')->options($roleModel::all()->pluck('name', 'id'))->rules('required');
        $form->text('job_desc', '工作职责')->rules('required');
        $form->image('avatar', trans('admin.avatar'));
        $form->password('password', trans('admin.password'))->rules('required|confirmed');
        $form->password('password_confirmation', trans('admin.password_confirmation'))->rules('required')
            ->default(function ($form) {
                return $form->model()->password;
            });

        $form->ignore(['password_confirmation']);

        //$form->multipleSelect('permissions', trans('admin.permissions'))->options($permissionModel::all()->pluck('name', 'id'));
        $form->textarea('remark', '备注信息');
		$form->hidden('type')->default(1);

        $form->saving(function (Form $form) {
            if ($form->password && $form->model()->password != $form->password) {
                $form->password = \Hash::make($form->password);
            }
        });

        return $form;
    }
}

