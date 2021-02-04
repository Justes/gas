<?php

namespace App\Console;

use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;
use App\Models\{Article, ExpireTip, Station};

class Kernel extends ConsoleKernel
{
    /**
     * The Artisan commands provided by your application.
     *
     * @var array
     */
    protected $commands = [
        //
    ];

    /**
     * Define the application's command schedule.
     *
     * @param  \Illuminate\Console\Scheduling\Schedule  $schedule
     * @return void
     */
    protected function schedule(Schedule $schedule)
    {
        // $schedule->command('inspire')
        //          ->hourly();
		$schedule->call(function() {
			$this->articles();
		})->dailyAt('02:00');

		$schedule->call(function() {
			$this->postArticles();
		})->hourly();

		$schedule->call(function() {
			$this->sendMsg();
		})->everyMinute();
    }

    /**
     * Register the commands for the application.
     *
     * @return void
     */
    protected function commands()
    {
        $this->load(__DIR__.'/Commands');

        require base_path('routes/console.php');
    }

	protected function articles() {
		$arts = Article::where(['effect_status' => 0, 'effect_type' => 1])->get();
		$now = time();
		foreach($arts as $item) {
			$end = strtotime($item->send_time) + $item->effect_days * 86400;
			if($end < $now) {
				$item->effect_status = 1;
				$item->save();
			}
		}
	}

	protected function postArticles() {
		$arts = Article::where(['effect_status' => 0, 'send_type' => 1, 'post_status' => 1])->get();
		$now = time();
		foreach($arts as $item) {
			if($now > strtotime($item->send_time)) {
				$item->post_status = 0;
				$item->save();
			}
		}
	}

	protected function sendMsg() {
		$now = date('Y-m-d H:i');
		$tips = ExpireTip::where('trigger_time', 'like', $now.'%')->get();
		foreach($tips as $item) {
			$content = '';
			$userIds = [];
			$sts = Station::whereIn('id', $item->station_ids)->get();
			foreach($sts as $st) {
				if(!in_array($st->admin_user_id, $userIds)) {
					$userIds[] = $st->admin_user_id;
				}
				$content .= '<p>'.$st->station_name.'</p>';
			}

			$data['title'] = '通知';
			$data['cate_id'] = 1;
			$data['content'] = $content.'<p>'.$item->remark.'</p>';
			$data['receive_type'] = 1;
			$data['post_user_id'] = 1;
			$data['receive_user_ids'] = $userIds;
			$data['source'] = 1;
			$data['send_time'] = date('Y-m-d H:i:s');
			Article::create($data);
		}
	}
}
