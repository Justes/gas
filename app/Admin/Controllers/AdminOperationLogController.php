<?php

namespace App\Admin\Controllers;

use App\Models\{AdminOperationLog, AdminMenu};
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Illuminate\Support\Arr;

class AdminOperationLogController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '操作日志';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
       $grid = new Grid(new AdminOperationLog());

        $grid->model()->orderBy('id', 'DESC');

        $grid->column('id', __('Id'));//->sortable();
        $grid->column('user.name', __('User'));
		$grid->column('method')->display(function($v) {
			$arr = ['GET' => '查看', 'POST' => '新增', 'PUT' => '修改', 'DELETE' => '删除', 'LOGIN' => '登录'];
			return $arr[$v] ?? '';
		});
		/*->display(function ($method) {
            $color = Arr::get(OperationLog::$methodColors, $method, 'grey');

            return "<span class=\"badge bg-$color\">$method</span>";
        });
		 */
		$grid->column('path')->display(function($v) {
			if($v == 'login') {
				return '后台';
			}

			$str = substr($v, 6);
			if(empty($str)) {
				$str = '/';
			} else {
				if(strpos($str, 'create')) {
					return '查看';
				} else {
					if($this->method != 'GET') {
						$arr = explode('/', $str);
						$str = $arr[0] ?? '/';
					}
				}
			}
			$menu = AdminMenu::where('uri', $str)->first();
			return $menu->title ?? '首页';
		});

		//->label('info');
		/*
        $grid->column('ip');//->label('primary');
        $grid->column('input')->display(function ($input) {
            $input = json_decode($input, true);
            $input = Arr::except($input, ['_pjax', '_token', '_method', '_previous_']);
            if (empty($input)) {
                return '';
                //return '<code>{}</code>';
            }

            return '<pre>'.json_encode($input, JSON_PRETTY_PRINT | JSON_HEX_TAG).'</pre>';
        });
		 */

        $grid->column('created_at', trans('admin.created_at'));

        $grid->actions(function (Grid\Displayers\Actions $actions) {
            $actions->disableEdit();
            $actions->disableView();
        });

        $grid->disableCreateButton();

        $grid->filter(function (Grid\Filter $filter) {
			$filter->disableIdFilter();

            $userModel = config('admin.database.users_model');

            $filter->equal('user_id', __('User'))->select($userModel::all()->pluck('name', 'id'));
			/*
            $filter->equal('method', __('Method'))->select(array_combine(AdminOperationLog::$methods, AdminOperationLog::$methods));
            $filter->like('path', __('Path'));
            $filter->equal('ip');
			*/
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
        $show = new Show(AdminOperationLog::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('user_id', __('User id'));
        $show->field('path', __('Path'));
        $show->field('method', __('Method'));
        $show->field('ip', __('Ip'));
        $show->field('input', __('Input'));
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
        $form = new Form(new AdminOperationLog());

        $form->number('user_id', __('User id'));
        $form->text('path', __('Path'));
        $form->text('method', __('Method'));
        $form->ip('ip', __('Ip'));
        $form->textarea('input', __('Input'));

        return $form;
    }
}
