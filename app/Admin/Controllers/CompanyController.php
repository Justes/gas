<?php

namespace App\Admin\Controllers;

use App\Models\{Company, Station};
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class CompanyController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '公司';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Company());
		$grid->model()->orderBy('id', 'desc');

		$grid->filter(function($filter) {
			$filter->disableIdFilter();
			$filter->equal('id', '编号');
			$filter->like('company_name', '公司名');
			$filter->equal('ck_status', '审核状态')->select(['未审核', '已通过']);
		});

        $grid->column('id', __('编号'));
        $grid->column('company_name', __('公司名'));
		$grid->column('station_ids', __('站点'))->display(function($v) {
			return Station::where('company_id', $this->id)->get()->implode('station_name', ',');
		});
        $grid->column('addr', __('地址'));
		/*
		$grid->column('position', __('Position'));
        $grid->column('contact_user', __('联系人'));
        $grid->column('contact_user_mobile', __('联系人电话'));
        $grid->column('contact_user_tel', __('Contact user tel'));
        $grid->column('permit', __('License'));
        $grid->column('permit_pic', __('License pic'));
        $grid->column('website', __('Website'));
        $grid->column('legal_mobile', __('Legal mobile'));
        $grid->column('legal_idnum', __('Legal idnum'));
        $grid->column('secure_mobile', __('Secure mobile'));
        $grid->column('secure_idnum', __('Secure idnum'));
		 */
        $grid->column('legal_name', __('法人'));
        $grid->column('secure_name', __('安全责任人'));
        $grid->column('created_at', __('录入时间'));
		$grid->column('ck_status_text', __('审核状态'));

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
        $show = new Show(Company::findOrFail($id));

        $show->field('id', __('编号'));
        $show->field('company_name', __('公司名'));
        //$show->field('gas_stations', __('Gas stations'));
        $show->field('addr', __('公司地址'));
        $show->field('lng', __('经度'));
        $show->field('lat', __('纬度'));
        $show->field('contact_user', __('联系人'));
        $show->field('contact_user_mobile', __('联系人手机'));
        $show->field('contact_user_tel', __('联系人电话'));
        $show->field('permit', __('经营许可'));
        $show->field('permit_pic', __('经营许可证'))->image();
        $show->field('website', __('网站'));
		$show->divider();

        $show->field('legal_name', __('法人'));
        $show->field('legal_mobile', __('法人手机'));
        $show->field('legal_idnum', __('法人身份证'));
		$show->divider();

        $show->field('secure_name', __('安全责任人'));
        $show->field('secure_mobile', __('安全责任人手机'));
        $show->field('secure_idnum', __('身份证号'));
        $show->field('ck_status_text', __('审核状态'));
		$show->divider();

        $show->field('created_at', '录入时间');

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Company());

        $form->text('company_name', __('公司名'))->rules('required');
        //$form->text('gas_stations', __('Gas stations'));
        $form->text('addr', __('公司地址'))->rules('required');
		$form->latlong('lat', 'lng', '经纬度')->height(600);
        $form->text('contact_user', __('联系人'))->rules('required');
        $form->text('contact_user_mobile', __('联系人手机'))->rules('required', );
        $form->text('contact_user_tel', __('联系人电话'));
		$form->radio('permit', __('经营许可'))->options([1 => '有', 0 => '无'])->default(1);
		$form->image('permit_pic', '经营许可证')->disk('admin')->uniqueName();
        $form->text('website', __('网站'));
        $form->select('ck_status', __('审核状态'))->options([0 => '未审核', 1 => '已审核']);
		$form->divider();

        $form->text('legal_name', __('法人'))->rules('required');
        $form->text('legal_mobile', __('法人手机'))->rules('required');
        $form->text('legal_idnum', __('法人身份证'))->rules('required');
		$form->divider();

        $form->text('secure_name', __('安全责任人'))->rules('required');
        $form->text('secure_mobile', __('安全责任人手机'))->rules('required');
        $form->text('secure_idnum', __('身份证号'))->rules('required');

        return $form;
    }
}
