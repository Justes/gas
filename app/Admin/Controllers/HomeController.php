<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\Dashboard;
use Encore\Admin\Layout\Column;
use Encore\Admin\Layout\Content;
use Encore\Admin\Layout\Row;
use App\Models\{Company, Station};

class HomeController extends Controller
{
    public function index(Content $content)
    {

		$stations = Station::all();
		$companies = Company::all();
        return $content->view('admin.home', compact('stations', 'companies'));
			/*
            ->title('Dashboard')
            ->description('Description...');
            ->row(Dashboard::title())
            ->row(function (Row $row) {

                $row->column(4, function (Column $column) {
                    $column->append(Dashboard::environment());
                });

                $row->column(4, function (Column $column) {
                    $column->append(Dashboard::extensions());
                });

                $row->column(4, function (Column $column) {
                    $column->append(Dashboard::dependencies());
                });
            });
			 */
    }
}
