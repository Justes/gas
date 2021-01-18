<?php
require __DIR__.'/vendor/autoload.php';

$stomp = new \FuseSource\Stomp\Stomp('tcp://115.236.178.228:8132');
//$stomp = new \FuseSource\Stomp\Stomp('tcp://127.0.0.1:61613');
$stomp->connect();
$stomp->subscribe('test');
 
while(true) {
	$frame = $stomp->readFrame();
    if($frame) {
 
        $data = json_decode($frame->body, true);
        var_dump($data);
 
        $stomp->ack($frame);
    }
    sleep(1);
}
