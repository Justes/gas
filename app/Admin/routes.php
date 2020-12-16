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
	$router->resource('event-stats', EventStatController::class);
	$router->resource('bottle-stds', BottleStdController::class);
	$router->resource('gas-stats', GasStatController::class);
	$router->resource('gas-used-details', GasUsedDetailController::class);
});
