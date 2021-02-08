<?php

namespace App\Admin\Controllers;

use App\Models\{Station, AdminUser, Company, Zone};
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Encore\Admin\Widgets\Table;

class StationController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '燃气场站';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Station());

		$grid->model()->orderBy('id', 'desc');

		$grid->filter(function($filter) {
			$filter->disableIdFilter();
			$filter->like('station_name', __('场站名'));
			$filter->equal('ck_status', '审核状态')->select(['未审核', '已审核']);
		});

        $grid->column('id', __('编号'));
        $grid->column('station_name', __('场站名称'));
        $grid->column('company_name', __('所属企业'));
        $grid->column('addr', __('位置'))->width(200);
		//$grid->column('permit_text', __('经营许可'));

		/*
		$grid->column('permit_text', __('许可证'))->modal('222', function($model) {
			return '<img src="'.\Storage::disk('admin')->url($model->permit_pic).'" />';
		});
		 */

        $grid->column('contact_user', __('安全负责人'));
        $grid->column('contact_user_mobile', __('负责人联系方式'));
        $grid->column('type_text', __('供气类型'));
		$grid->column('scope', __('供气范围'))->display(function($v) {
			$zones = Zone::all();
			$str = '';
			foreach($zones as $item) {
				if(is_array($item->station_ids) && in_array($this->id, $item->station_ids)) {
					$str .= $item->zone_range.', ';
				}
			}
			$str = rtrim($str, ', ');
			return $str;
		})->width(200);
        $grid->column('store_gas', __('Store gas'));
		/*
		$grid->column('device_ids', __('设备'))->display(function($v) {
			return '设备';
		})->modal('设备', function($model) {
			$devices = $model->devices()->paginate()->map(function ($device) {
				return $device->only(['device_no', 'device_name', 'device_type', 'admin_user_name', 'device_status_text', 'fix_logs']);
			});
			return new Table(['设备编号', '设备名', '设备型号', '负责人', '设备状态', '维修记录'], $devices->toArray());
		});
		 */
        $grid->column('created_at', __('Created at'));

		/*
        $grid->column('contact_user_tel', __('电话'));
        $grid->column('permit_no', __('Permit no'));
        $grid->column('permit_pic', __('Permit pic'));
        $grid->column('schedule', __('Schedule'));
        $grid->column('remark', __('Remark'));
        $grid->column('backup_no', __('Backup no'));
        $grid->column('backup_company_id', __('Backup company'));
        $grid->column('ck_status', __('Ck status'));
        $grid->column('ck_status_text', __('Ck status text'));
        $grid->column('license', __('License'));
        $grid->column('license_no', __('License no'));
        $grid->column('license_pic', __('License pic'));
        $grid->column('device_ids', __('Device ids'));
        $grid->column('admin_user_id', __('Admin user id'));
		 */

		$grid->actions(function ($actions) {
			$row = $actions->row;
			// append一个操作
			$actions->prepend('<a href="/admin/stations/'.$row['id'].'/edit"><i class="fa fa-calendar" style="padding-right:10px;">值班信息</i></a>');
			$actions->prepend('<a href="/admin/workers?station_id='.$row['id'].'"><i class="fa fa-users" style="padding-right:10px;">人员</i></a>');
			$actions->prepend('<a href="/admin/devices?station_id='.$row['id'].'"><i class="fa fa-cubes" style="padding-right:10px;">设备</i></a>');
			$actions->prepend('<a href="/admin/zones?station_names='.$row['station_name'].'"><i class="fa fa-globe" style="padding-right:10px;">供气区域</i></a>');
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
        $show = new Show(Station::findOrFail($id));

        $show->field('id', __('编号'));
        $show->field('station_name', __('站点名称'));
        $show->field('company_name', __('所属公司'));
        $show->field('type_text', __('类型'));
        $show->field('bonus_type_text', __('补贴类型'));
        $show->field('store_gas', __('Store gas'));
        $show->field('addr', __('位置'));
        $show->field('contact_user', __('安全负责人'));
        $show->field('contact_user_mobile', __('负责人联系方式'));
        $show->field('contact_user_tel', __('联系人电话'));
        $show->field('permit', __('经营许可'));
        $show->field('permit_no', __('许可证编号'));
        $show->field('permit_pic', __('经营许可证'));
        $show->field('schedule', __('值班信息'));
        $show->field('remark', __('备注信息'));
        $show->field('backup_no', __('备案编号'));
        $show->field('backup_company_id', __('申报单位'));
        $show->field('ck_status_text', __('备案状态'));
        //$show->field('license', __('License'));
        $show->field('license_no', __('营业执照编号'));
        $show->field('license_pic', __('营业执照照片'))->image();
        //$show->field('admin_user_id', __('Admin user id'));
        $show->field('created_at', __('录入时间'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Station());

        $form->text('station_name', __('站点名称'))->rules('required');
        $form->select('company_id', __('所属企业'))->options(Company::all()->pluck('company_name', 'id'))->rules('required');
        $form->select('type', __('类型'))->options(['换瓶站', 'LNG气站', 'CNG气站']);
        /* $form->select('bonus_type', __('补贴类型'))->options(['换瓶', '自采暖']); */
        $form->select('bonus_type', __('补贴类型'))->options([0 => '无补贴', 1 => '换瓶', 2 => '自采暖'])->default(0)->rules('required');
        $form->number('store_gas', __('Store gas'))->default(0);
        $form->text('addr', __('位置'))->rules('required');
		$form->latlong('lat', 'lng', '经纬度')->height(600)->rules('required');
		$form->divider();

        $form->text('contact_user', __('安全负责人'));
        $form->text('contact_user_mobile', __('负责人联系方式'));
        $form->text('contact_user_tel', __('联系人电话'));

        $form->radio('permit', __('经营许可'))->options([1 => '有', 0 => '无'])->default(1);
		$form->image('permit_pic', '经营许可证')->disk('admin')->uniqueName();

        $form->textarea('schedule', __('值班信息'));
        $form->textarea('remark', __('备注信息'));
		$form->divider();

        $form->text('backup_no', __('备案编号'));
        $form->select('backup_company_id', __('申报单位'))->options(Company::all()->pluck('company_name', 'id'));
        $form->select('ck_status', __('备案状态'))->options(['未审核', '已审核']);
		$form->divider();

        //$form->switch('license', __('License'))->default(1);
        $form->text('license_no', __('营业执照编号'));
        $form->text('permit_no', __('许可证编号'));
        $form->image('license_pic', __('营业执照照片'))->disk('admin')->uniqueName();
		$form->divider();

        $form->select('admin_user_id', __('人员分配'))->options(AdminUser::where('type', 1)->get()->pluck('name', 'id'))->rules('required');

        return $form;
    }
}
