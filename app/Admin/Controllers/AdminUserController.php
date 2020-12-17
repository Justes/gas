<?php

namespace App\Admin\Controllers;

use App\Models\{AdminUser, Station, Organ};
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class AdminUserController extends AdminController
{
    /**
     * {@inheritdoc}
     */
    protected function title()
    {
        return '账号管理';
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
		$grid->model()->where('type', 0)->orderBy('id', 'desc');

		$grid->filter(function($filter) {
			$filter->disableIdFilter();
			$filter->equal('station_id', '站点')->select(['1', '2']);
		});

        $grid->column('id', '编号')->sortable();
        $grid->column('username', trans('admin.username'));
        $grid->column('name', '姓名');
		$grid->column('station_id', '所属站点')->display(function($v) {
			$st = Station::find($v);
			return $st->station_name ?? '';
		});
		$grid->column('organ_id', '所属组织')->display(function($v) {
			$organ = Organ::find($v);
			return $organ->organ_name ?? '';
		});
		$grid->column('gender', '性别')->display(function($v) {
			$arr = ['女', '男'];
			return $arr[$v];
		});
        $grid->column('mobile', '联系电话');
        $grid->column('roles', '职务')->display(function($v) {
			return $v[0]['name'];
		});
        $grid->actions(function (Grid\Displayers\Actions $actions) {
            if ($actions->getKey() == 1) {
                $actions->disableDelete();
            }
        });

        $grid->tools(function (Grid\Tools $tools) {
            $tools->batch(function (Grid\Tools\BatchActions $actions) {
                $actions->disableDelete();
            });
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
        $show->field('roles', trans('admin.roles'))->as(function ($roles) {
            return $roles->pluck('name');
        })->label();
        $show->field('permissions', trans('admin.permissions'))->as(function ($permission) {
            return $permission->pluck('name');
        })->label();
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
        $form->select('organ_id', '组织')->options(Organ::where('pid',0)->pluck('organ_name', 'id'))->load('organ_id2', '/admin/organs/lists')->rules('required');
		$form->select('organ_id2', '二级组织')->options(function() {
			$organId = $this->organ_id;
			return Organ::where('pid', $organId)->pluck('organ_name', 'id');
		})->load('organ_id3', '/admin/organs/lists');
		$form->select('organ_id3', '三级组织')->options(function() {
			$organId = $this->organ_id2;
			return Organ::where('pid', $organId)->pluck('organ_name', 'id');
		});
        $form->text('mobile', '电话')->rules('required');
		$form->radio('status', '账号状态')->options(['启用', '禁用'])->default(0);
        $form->multipleSelect('roles', '职务')->options($roleModel::all()->pluck('name', 'id'));
        $form->image('avatar', trans('admin.avatar'));
        $form->password('password', trans('admin.password'))->rules('required|confirmed');
        $form->password('password_confirmation', trans('admin.password_confirmation'))->rules('required')
            ->default(function ($form) {
                return $form->model()->password;
            });

        $form->ignore(['password_confirmation']);

        //$form->multipleSelect('permissions', trans('admin.permissions'))->options($permissionModel::all()->pluck('name', 'id'));
        $form->textarea('remark', '备注信息');

        $form->saving(function (Form $form) {
            if ($form->password && $form->model()->password != $form->password) {
                $form->password = \Hash::make($form->password);
            }
        });

        return $form;
    }
}
