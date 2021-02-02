layui.use(['element', 'layer'], function(){
  var element = layui.element();
  var layer = layui.layer;  
  //监听折叠
  element.on('collapse(chatMain)', function(data){
    //layer.msg('展开状态：'+ data.show);
  });
});

var layim;
var getlist = '/api/user/chat';
var token = LA.token;
var token = 'e00cf25ad42683b3df678c61f42c6bda';

// 获取用户信息
$(function(){
	$.ajax({
		url: getlist,
     	headers:{'token':token},
     	success: function(res) {
     		var data = res.data;
			var mine = {
				  "username": LA.user.username //我的昵称
				  ,"id": LA.user.id //我的ID
				  ,"status": "online" //在线状态 online：在线、hide：隐身
				  ,"sign": "" //我的签名
				  ,"avatar": LA.user.avatar //我的头像
				};
			// 初始化IM
			initIM(mine)
     		$.each(data, function(index, item) {
     			buildItem(item)     			
            })
        }
	});
	
	// 初始化即时通讯
	function initIM(mine) {
		layui.use('layim', function(layim){
			// 初始化配置
			layim.config({
				//我的信息
				init: {
					mine: mine
				}
				,brief:true
				,min:false
				,right:'50px'
				,title:'联系人'
				,isgroup:true
				,issearch:false
				,isskin:false
				,copyright:true
				,chatLog: '/api/imsg'
			});
			//建立WebSocket通讯
			var socket = new WebSocket("ws://8.129.161.138:8181/ws");
			//连接成功时触发
			socket.onopen = function(){
				var openData = '{"token":"'+token+'","type":9}';
				socket.send(openData);
			};
			
			//监听收到的消息
			socket.onmessage = function(res){
				if(typeof res.data=='object'){
					var data = res.data;
				} else if (res.data=='success connected'){
					var data = res.data;
				} else{
					var data = eval("("+res.data+")");
				}
				console.log(data);
				if(data.type === 1){
					var message = {
					  username: data.name
					  ,avatar: data.avatar
					  ,id: data.user_id
					  ,type: 'friend'
					  ,friend: data.user_id
					  ,content: data.msg
					  ,timestamp: data.timestamp * 1000
					};
					//console.log(message);
					layim.getMessage(message);
				}
			};
			//监听的错误
			socket.onerror = function(e) {
				  console.log("出现错误");
				  console.log(e);
			};
			
			//监听发送消息
			layim.on('sendMessage', function(res){
				// 发送消息
				var mine = res.mine;
				// console.log(mine);
				var to = res.to;
				var data = {
						"token": token,
						"msgid":(new Date()).getTime().toString(),
						"timestamp":Date.parse(new Date())/1000,
						"type":1,
						"chat_type": 1,
						"msg_type": 1,
						"user_id": mine.id,
						"to":Number(to.id),
						"msg":mine.content,
						"name":mine.username,
						"avatar":mine.avatar,
						"file_url":'',
						"file_name":'',
						"file_ext":'',
						"extras":'',
					};
				console.log(data);
				socket.send( JSON.stringify(data) );
			});
			
			
	
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
			
			
		})
	}
	
	
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
	$("#chat-aside-toggle").click(function(){
		$('#aside-container').toggleClass('on')
	})
})
