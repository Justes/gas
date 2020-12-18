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
});

Route::group(['namespace' => 'Api', 'middleware' => 'auth.token'], function() {
	Route::post('user/upload', 'UserController@upload');
	Route::get('user/info', 'UserController@info');
	Route::post('user/update', 'UserController@update');
	Route::post('user/reset', 'UserController@reset');
	Route::get('user/contacters', 'UserController@contacters');
	Route::resource('room', 'RoomController');
});
