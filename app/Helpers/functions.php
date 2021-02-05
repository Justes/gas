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

if (!function_exists('writeLog')) {
    function writeLog($dir, $content)
    {
        $date    = date('Y-m-d');
        $now     = date('Y-m-d H:i:s');
        $dirPath = storage_path() . DIRECTORY_SEPARATOR . "logs" . DIRECTORY_SEPARATOR . $dir;
        if (!is_dir($dirPath)) {
            mkdir($dirPath, 0775);
        }
 
        $file = $dirPath . DIRECTORY_SEPARATOR . $date . '.log';
        if (!file_exists($file)) {
            $f = fopen($file, 'w');
            chmod($file, 0777);
            fclose($f);
        }
        file_put_contents($file, '[' . $now . '] '. ' ------ '. time() .' ------ ' . $content . PHP_EOL, FILE_APPEND);
    }
}

if (!function_exists('curl')) {
    function curl($url, $params = '', $authorization = '', $type = 'GET', $file = 'curl', $timeout = 20)
    {
        $stime = microtime(true); //运行开始时间
        $curl  = curl_init();
        if ($params && $type == 'GET') {
            $url .= '?' . http_build_query($params);
        }

        $msgid    = uniqid();
        $content1 = 'msgid:' . $msgid . '------url:' . $url . ',params:' . json_encode($params) . ',auth:' . $authorization . ',type:' . $type;
        writeLog($file, $content1);

        curl_setopt($curl, CURLOPT_URL, $url);
        curl_setopt($curl, CURLOPT_CUSTOMREQUEST, $type);
        if ($type == 'POST') {
            curl_setopt($curl, CURLOPT_POST, 1);
            curl_setopt($curl, CURLOPT_POSTFIELDS, $params);
        }
        curl_setopt($curl, CURLOPT_TIMEOUT, $timeout);                // 设置超时限制防止死循环
        if ($authorization) {
            $header[] = 'Authorization:' . $authorization;
            curl_setopt($curl, CURLOPT_HTTPHEADER, $header);
        }
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        $output = curl_exec($curl);

        if ($output === false) {
            if (curl_errno($curl) == CURLE_OPERATION_TIMEDOUT) {
                curl_close($curl);
                writeLog($file . 'err', $content1);
                writeLog($file . 'err', 'timeout ' . $timeout . 's');
                return false;
            }
        }

        curl_close($curl);
        $etime  = microtime(true);
        $time   = $etime - $stime;
        $result = json_decode($output, true);

        $content2 = 'msgid:' . $msgid . '------begin:' . $stime . ',end:' . $etime . ',exe:' . $time . ',result:' . $output;
		writeLog($file, $content2);

        return $result;
    }
}

if (!function_exists('getfirstchar')) {
	function getfirstchar($s0){    
		$fchar = ord($s0{0});  
		if($fchar >= ord("A") and $fchar <= ord("z") )return strtoupper($s0{0});   
		$s1 = get_encoding($s0,'GB2312');  
		$s2 = get_encoding($s1,'UTF-8');  
		if($s2 == $s0){$s = $s1;}else{$s = $s0;}  
		$asc = ord($s{0}) * 256 + ord($s{1}) - 65536;  
		if($asc >= -20319 and $asc <= -20284) return "A";  
		if($asc >= -20283 and $asc <= -19776) return "B";  
		if($asc >= -19775 and $asc <= -19219) return "C";  
		if($asc >= -19218 and $asc <= -18711) return "D";  
		if($asc >= -18710 and $asc <= -18527) return "E";  
		if($asc >= -18526 and $asc <= -18240) return "F";  
		if($asc >= -18239 and $asc <= -17923) return "G";  
		if($asc >= -17922 and $asc <= -17418) return "I";  
		if($asc >= -17417 and $asc <= -16475) return "J";  
		if($asc >= -16474 and $asc <= -16213) return "K";  
		if($asc >= -16212 and $asc <= -15641) return "L";  
		if($asc >= -15640 and $asc <= -15166) return "M";  
		if($asc >= -15165 and $asc <= -14923) return "N";  
		if($asc >= -14922 and $asc <= -14915) return "O";  
		if($asc >= -14914 and $asc <= -14631) return "P";  
		if($asc >= -14630 and $asc <= -14150) return "Q";  
		if($asc >= -14149 and $asc <= -14091) return "R";  
		if($asc >= -14090 and $asc <= -13319) return "S";  
		if($asc >= -13318 and $asc <= -12839) return "T";  
		if($asc >= -12838 and $asc <= -12557) return "W";  
		if($asc >= -12556 and $asc <= -11848) return "X";  
		if($asc >= -11847 and $asc <= -11056) return "Y";  
		if($asc >= -11055 and $asc <= -10247) return "Z";  
		return null;  
	}  
}

if (!function_exists('get_encoding')) {
	 function get_encoding($data,$to){  
		$encode_arr=array('UTF-8','ASCII','GBK','GB2312','BIG5','JIS','eucjp-win','sjis-win','EUC-JP');   
		$encoded=mb_detect_encoding($data, $encode_arr);   
		$data = mb_convert_encoding($data,$to,$encoded);   
		return $data;  
	}   
}
