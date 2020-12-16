<?php

if (!function_exists('debug')) {
    function debug($data, $type = 0, $exit = 1)
    {
        echo '<pre>';
        empty($type) ? print_r($data) : var_dump($data);
        echo '</pre>';
        if ($exit) {
            exit;
        }
    }
}

if (!function_exists('ext')) {
    function ext($file)
    {
		if(strpos($file, '.')) {
			$arr = explode('.', $file);
			if(is_array($arr)) {
				return end($arr);
			}
		}
		return 'unknown';
    }
}

if (!function_exists('changTime')) {
	function changeTime($time) {
		$dur = '';
		$d = floor($time / (3600*24));
		$h = floor(($time % (3600*24)) / 3600);
		$m = floor((($time % (3600*24)) % 3600) / 60);
		if($d > '0'){
			$dur = $d.'天'.$h.'小时'.$m.'分';
		} else {
			if($h!='0') {
				$dur = $h.'小时'.$m.'分';
			} else {
				$dur = $m.'分';
			}
		}
		return $dur;
	}
}

if (!function_exists('errcode')) {
    function errcode($code = '', $lan = 'cn')
    {
        $lang = request()->header('lang');
        if (empty($lang)) $lang = $lan;
        $err = config('errcode_' . $lang);
        if (!empty($code)) {
            return $err[$code];
        }
        return $err;
    }
}

if (!function_exists('err')) {
    function err($errcode = 0, $data = '', $message = '')
    {
        $err = errcode();

        $message = empty($message) ? $err[$errcode] : $message;
        $arr     = [
            'code'    => $errcode,
            'message' => $message,
            'data'    => $data
        ];

        if (empty($data) || $data == '1') {
            unset($arr['data']);
        }

        return response()->json($arr);
    }
}
