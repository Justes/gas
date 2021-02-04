<?php

use Illuminate\Routing\Router;

Admin::routes();

Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
    'as'            => config('admin.route.prefix') . '.',
], function (Router $router) {

    $router->get('/', 'HomeController@index')->name('home');
    $router->get('home/search', 'HomeController@search');
	$router->resource('users', UserController::class);
	$router->resource('companies', CompanyController::class);
	$router->resource('admin-users', AdminUserController::class);
	$router->resource('workers', WorkerController::class);
	$router->resource('stations', StationController::class);
	$router->resource('devices', DeviceController::class);
	$router->resource('zones', ZoneController::class);
	$router->resource('notices', NoticeController::class);
	$router->resource('articles', ArticleController::class);
	$router->resource('article-secs', ArticleSecController::class);
	$router->resource('article-govs', ArticleGovController::class);
	$router->resource('attachments', AttachmentController::class);
	$router->resource('categories', CategoryController::class);
	$router->resource('stores', StoreController::class);
	$router->resource('events', EventController::class);
	$router->resource('event-types', EventTypeController::class);
	$router->resource('event-limits', EventLimitController::class);
	$router->resource('event-stats', EventStatController::class);
	$router->resource('bottle-stds', BottleStdController::class);
	$router->resource('gas-stats', GasStatController::class);
	$router->resource('gas-used-details', GasUsedDetailController::class);
	$router->post('organs/store', 'OrganController@store');
	$router->post('organs/update', 'OrganController@update');
	$router->get('organs/lists', 'OrganController@lists');
	$router->resource('organs', OrganController::class);
	$router->resource('station-stds', StationStdController::class);
	$router->resource('station-exams', StationExamController::class);
	$router->resource('station-exam-stds', StationExamStdController::class);
	$router->resource('event-exams', EventExamController::class);
	$router->resource('event-stds', EventStdController::class);
	$router->resource('fire-exams', FireExamController::class);
	$router->resource('fire-stds', FireStdController::class);
	$router->resource('fire-reports', FireReportController::class);
	$router->resource('fire-tips', FireTipController::class);
	$router->resource('sec-exams', SecExamController::class);
	$router->resource('sec-stds', SecStdController::class);
	$router->resource('sec-reports', SecReportController::class);
	$router->resource('manage-exams', ManageExamController::class);
	$router->resource('manage-stds', ManageStdController::class);
	$router->resource('manage-reports', ManageReportController::class);
	$router->resource('manage-tips', ManageTipController::class);
	$router->resource('gas-exams', GasExamController::class);
	$router->resource('gas-reports', GasReportController::class);
	$router->resource('sale-exams', SaleExamController::class);
	$router->resource('sale-stds', SaleStdController::class);
	$router->resource('sale-stats', SaleStatController::class);
	$router->resource('sale-reports', SaleReportController::class);
	$router->resource('warm-exams', WarmExamController::class);
	$router->resource('warm-stds', WarmStdController::class);
	$router->resource('warm-reports', WarmReportController::class);
	$router->resource('warm-sale-details', WarmSaleDetailController::class);
	$router->resource('cert-exams', CertExamController::class);
	$router->resource('cert-stds', CertStdController::class);
	$router->resource('eval-exams', EvalExamController::class);
	$router->resource('eval-stds', EvalStdController::class);
	$router->resource('eval-stats', EvalStatController::class);
	$router->resource('cert-periods', CertPeriodController::class);
	$router->resource('bottles', BottleController::class);
	$router->resource('bottle-sale-logs', BottleSaleLogController::class);
	$router->resource('bottle-sale-details', BottleSaleDetailController::class);
	$router->resource('chats', ChatController::class);
	$router->resource('intfcs', IntfcContrller::class);
	$router->resource('admin-operation-logs', AdminOperationLogController::class);
	$router->resource('bonus-configs', BonusConfigController::class);
});
