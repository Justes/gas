<!DOCTYPE html>
<html lang="{{ config('app.locale') }}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>{{ Admin::title() }} @if($header) | {{ $header }}@endif</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

    @if(!is_null($favicon = Admin::favicon()))
    <link rel="shortcut icon" href="{{$favicon}}">
    @endif

    {!! Admin::css() !!}
	<link rel="stylesheet" href="{{ admin_asset("packages/layer/src/css/layui.css") }}">
    <script src="{{ Admin::jQuery() }}"></script>
    {!! Admin::headerJs() !!}
    
    <script src="{{ admin_asset("packages/layer/layer.js")}}"></script>
    <script src="{{ admin_asset("packages/layer/src/layui.js")}}"></script>
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body class="hold-transition {{config('admin.skin')}} {{join(' ', config('admin.layout'))}} fixed">

@if($alert = config('admin.top_alert'))
    <div style="text-align: center;padding: 5px;font-size: 12px;background-color: #ffffd5;color: #ff0000;">
        {!! $alert !!}
    </div>
@endif

<div class="wrapper">

    @include('admin::partials.header')

    @include('admin::partials.sidebar')

    <div class="content-wrapper" id="pjax-container">
        {!! Admin::style() !!}
        <div id="app">
        @yield('content')
        </div>
        {!! Admin::script() !!}
        {!! Admin::html() !!}
    </div>

</div>

<button id="totop" title="Go to top" style="display: none;"><i class="fa fa-chevron-up"></i></button>

<script>
    function LA() {}
    LA.token = "{{ csrf_token() }}";
    LA.user = @json($_user_);
</script>

<!-- REQUIRED JS SCRIPTS -->
{!! Admin::js() !!}

<script>
layui.use(['element', 'layer'], function(){
  var element = layui.element();
  var layer = layui.layer;  
  //监听折叠
  element.on('collapse(chatMain)', function(data){
    //layer.msg('展开状态：'+ data.show);
  });
});
</script>
<script>
var layim;
var getlist = '/api/user/chat';
var token = LA.token;
var token = 'e00cf25ad42683b3df678c61f42c6bda';
layui.use('layim', function(layimObj){
  layim = layimObj;
  //基础配置
  layim.config({
    //初始化接口
    init: {
//       url: getlist,
//       headers:{'token':token},
      data: {}
    }
	,brief:false
	,min:true
	,right:'5000px'
	,title:'联系人'
	,isgroup:true
	,issearch:false
	,isskin:false
	,copyright:false
    ,notice: true //是否开启桌面消息提醒，默认falsemp3
    
    //,msgbox: layui.cache.dir + 'css/modules/layim/html/msgbox.html' //消息盒子页面地址，若不开启，剔除该项即可
    //,chatLog: layui.cache.dir + 'css/modules/layim/html/chatLog.html' //聊天记录页面地址，若不开启，剔除该项即可
//     ,chatLog: '{:U("chat/chatlog")}' //聊天记录页面地址，若不开启，剔除该项即可
    
  });
$(function(){
	$.ajax({
		url: getlist,
     	headers:{'token':token},
     	success: function(res) {
     		var data = res.data;
     		var msgList = [];
     		var groupList = [];
     		$.each(data, function(index, item) {
     			buildItem(item)     			
            })
        }
	});
	function buildItem(item) {
		var html = '<li class="layim-list-item" name="'+item.name+'" avatar="'+item.avatar+'"';
		if(item.chat_type == 1){
			html += ' openid="'+item.to+'" type="friend">';
			html += '<img src="'+item.avatar+'">';
			html += '<span>'+item.name+'</span>';
			html += '</li>';
			$(".chatList").append(html)
        } else if(item.chat_type == 2) {
        	html += ' unitid="'+item.to+'">';
        	html += '<img src="'+item.avatar+'">';
        	html += '<span>'+item.name+'</span>';
			html += '</li>';
			$(".chatGroupList").append(html)
        }
	}
})
	$(".chatList").on('click', '.layim-list-item', function(){
		var name = $(this).attr("name");
		var avatar = $(this).attr("avatar");
		var openid = $(this).attr("openid");
		var type = $(this).attr("type");
		layim.chat({
		  name: name //名称
		  ,type: type //聊天类型
		  ,avatar: avatar //头像
		  ,id: openid //好友id
		  ,closeBtn:2
		})
	})
	$(".chatGroupList").on('click', '.layim-list-item', function(){
		var name = $(this).attr("name");
		var avatar = $(this).attr("avatar");
		var unitid = $(this).attr("unitid");
		layim.chat({
		  name: name //名称
		  ,type: 'group' //聊天类型
		  ,avatar: avatar //头像
		  ,id: unitid //好友id
		  ,closeBtn:2
		})
	})
	$("#chat-aside-toggle").click(function(){
		$('#aside-container').toggleClass('on')
	})
	//建立WebSocket通讯
	var socket = new WebSocket("ws://8.129.161.138:8181/ws");
	//连接成功时触发
	socket.onopen = function(){
		var open_data = '{"token":"'+token+'","type":9}';
		socket.send(open_data);
	};
	
	//监听收到的消息
	socket.onmessage = function(res){
		console.log(res.data);
		//var data = res.data;
		/* if(typeof res.data=='object'){
			var data = res.data;
		}else{
			var data = eval("("+res.data+")");
		}
		//console.log(data);
		//res为接受到的值，如 {"emit": "messageName", "data": {}}
		//emit即为发出的事件名，用于区分不同的消息
		//res = JSON.parse(res);
		if(data.type === 'chatMessage'){	
			//console.log(data);
			var message = {
			  username: data.data.username
			  ,avatar: data.data.avatar
			  ,id: data.data.id
			  ,type: data.data.type
			  ,groupname: data.data.groupname
			  ,content: data.data.content
			};
			//console.log(message);
			layim.getMessage(message); //res.data即你发送消息传递的数据（阅读：监听发送的消息）
		}
		if(data.type === 'say'){			
			console.log(data);
		}
		if(data.type === 'msg_push'){			
			console.log(data);
		}
		*/
	};
	
	socket.onerror = function(e) {
     	  console.log("出现错误");
		  console.log(e);
    };
  
  //监听layim建立就绪
  layim.on('ready', function(res){
    layim.on('sendMessage', function(res){
		// 发送消息
		var mine = JSON.stringify(res.mine);
		//console.log(mine);
		var to = JSON.stringify(res.to);
		var sendData = '{"type":"chatMessage","data":{"mine":'+mine+', "to":'+to+'}}';
		console.log(sendData);
		socket.send( sendData );
		//socket.send('{"type":"say","to_client_id":"all","to_client_name":"所有人","content":"'+res.mine.content+'"}');
	});
  });
});
function sendMsg(openid,name,avatar,type){
	layim.chat({
		name: name //名称
		,type: type //聊天类型
		,avatar: avatar //头像
		,id: openid //好友id
		,closeBtn:2
	})
}
</script>
</body>
</html>
