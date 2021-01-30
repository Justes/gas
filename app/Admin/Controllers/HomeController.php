<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use Encore\Admin\Layout\Content;
use App\Models\{Company, Station};
use App\Models\Zone;

class HomeController extends Controller
{
    public function index(Content $content)
    {
        
        $stations   = Station::all(["id", "lat", "lng", "station_name", "type", "permit", "company_id", "addr", "contact_user", "contact_user_mobile"])->toArray();
        $companies  = Company::all(["id", "lat", "lng", "company_name", "addr", "belongs", "contact_user", "contact_user_mobile"]);
        $counts = [
            'station' => count($stations),
            'company' => count($companies),
        ];
        if ($stations) {
            foreach ($stations as $key => $value) {
                $zones = Zone::whereRaw('FIND_IN_SET(?,station_ids)',[$value['id']])->where("zone_status", 0)->select(['zone_name', "zone_status"])->get()->toArray();
                $str = '';
                if ($zones) {
                    foreach($zones as $item) {
                        $str .= $item['zone_name'].', ';
                    }
                    $str = rtrim($str, ', ');
                }
                $stations[$key]['zones'] = $str;
            }
        }
        
        $stations = json_encode($stations);
        $companies = $companies ->toJson();
        return $content->view('admin.home', compact('stations', 'companies', 'counts'));
    }
}
