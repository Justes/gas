<?php
require __DIR__.'/vendor/autoload.php';

//$stomp = new \FuseSource\Stomp\Stomp('tcp://115.236.178.228:8132');
$stomp = new \FuseSource\Stomp\Stomp('tcp://127.0.0.1:61613');
$stomp->connect();

//订阅只对一个有效，如果启动多个脚本，只有一个会接收到消息
$result = $stomp->send('test', 1001);
var_dump($result);
