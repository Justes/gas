<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::group(['namespace' => 'Api'], function() {
	Route::get('/', 'IndexController@index');
	Route::post('user/login', 'UserController@login');
	Route::get('user/check', 'UserController@check');
	Route::get('callback', 'CallbackController@index');
	Route::get('user/detail', 'UserController@detail');
	Route::post('event/hurry', 'EventController@hurry');
	Route::get('imsg/export', 'ImMsgController@export');
});

Route::group(['namespace' => 'Api', 'middleware' => 'auth.token'], function() {
	Route::post('user/chatDel', 'UserController@chatDel');
	Route::get('user/chat', 'UserController@chat');
	Route::post('user/upload', 'UserController@upload');
	Route::get('user/info', 'UserController@info');
	Route::get('user/share', 'UserController@info');
	Route::post('user/update', 'UserController@update');
	Route::post('user/reset', 'UserController@reset');
	Route::get('user/contacters', 'UserController@contacters');

	Route::post('room/uexit', 'RoomController@uexit');
	Route::post('room/update', 'RoomController@update');
	Route::post('room/del', 'RoomController@del');
	Route::post('room/add', 'RoomController@add');
	Route::resource('room', 'RoomController');

	Route::get('imsg/files', 'ImMsgController@files');
	Route::resource('imsg', 'ImMsgController');

	Route::get('article/files', 'ArticleController@files');
	Route::get('article/view', 'ArticleController@view');
	Route::resource('article', 'ArticleController');

	Route::post('event/solve', 'EventController@solve');
	Route::resource('event', 'EventController');

	Route::post('report/job', 'ReportController@job');
	Route::post('report/gas', 'ReportController@gas');
	Route::post('report/consume', 'ReportController@consume');
	Route::post('report/fire', 'ReportController@fire');
	Route::post('report/secure', 'ReportController@secure');
	Route::post('report/manage', 'ReportController@manage');
	Route::get('report/logs', 'ReportController@logs');
	Route::resource('report', 'ReportController');
});
