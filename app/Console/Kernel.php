<?php

namespace App\Console;

use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;
use App\Models\Article;

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
}
