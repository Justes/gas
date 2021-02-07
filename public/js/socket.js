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
var friendList = '/api/user/contacters';
var socketUrl = "ws://8.129.161.138:8181/ws";
var token = LA.user.token;
var my_id = LA.user.id;
var chatArr = [];
// 获取用户信息
$(function(){
	$.ajax({
		url: getlist,
     	headers:{'token':token},
     	success: function(res) {
     		var data = res.data;
            chatArr = data;
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
                item.num = 0;
     		    if(item.chat_type==1 && item.to==my_id){

                }else {
                    buildItem(item)
                }
            })
        }
	});

    $.ajax({
        url: friendList,
        headers:{'token':token},
        success: function(res) {
            var data = res.data;
            var html = "";
            $.each(data.rooms, function(index, item) {
                html += '<li id="'+item.room_id+'" name="'+item.room_name+'" avatar="'+item.room_pic+'" chat_type="2"' ;
                html += 'openid="'+item.to+'">';
                html += '<img src="'+item.room_pic+'">';
                html += '<span>'+item.room_name+'</span>';
                html += '</li>';
            });
           $(".chatGroupList").append(html);

            var list = "";
            for(var i in data.users){
                list +='<div class="f-item">'
                list +='<div class="letter">'+i+'</div>'
                list +='<ul class="friend-msg">'

                var ulist = "";
                $.each(data.users[i], function(index, item) {
                    ulist +='<li id="'+item.user_id+'" name="'+item.name+'" avatar="'+item.avatar+'" chat_type="1" openid="'+item.user_id+'">'+
                            '<img src="'+item.avatar+'">'+
                            '<span>'+item.name+'</span>'+
                            '</li>'
                });
                list += ulist;
                list +='</ul>';
                list +='</div>';
            }
            $(".friend-wrapper").append(list)
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
			var socket = new WebSocket(socketUrl);
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
                console.log('收到的消息'+JSON.stringify(data));
				// console.log(chatArr)
                chatArr.forEach(function (item,index) {
                    if(data.oid == item.oid){
                        item.num = item.num+1;
                        item.msg = data.msg;
                        item.msg_type = data.msg_type;
                        updateItem(item,index)
                    }
                });
                layim.getMessage(data);
			};
			//监听的错误
			socket.onerror = function(e) {
				  console.log("出现错误");
				  console.log(e);
			};
			
			//监听发送消息
			layim.on('sendMessage', function(res){
			    console.log(res);
				// 发送消息
				var data = {
						"token": token,
						"msgid":(new Date()).getTime().toString(),
						"timestamp":Date.parse(new Date())/1000,
						"type":1,
						"chat_type": Number(res.type),
						"msg_type": Number(res.msg_type),
						"user_id": my_id,
						"to":Number(res.id),
						"msg":res.msg,
						"name":res.name,
						"avatar":res.avatar,
						"file_url":res.file_url,
						"file_name":res.file_name,
						"file_ext":res.file_ext,
						"extras":'',
					};
				socket.send( JSON.stringify(data) );
			});
			
			

			//消息列表
			$(".chatList").on('click', '.msg-item', function(){
				var name = $(this).attr("name");
				var avatar = $(this).attr("avatar");
				var openid = $(this).attr("openid");
				var type = $(this).attr("chat_type");
				var num = $(this).children().children('span');
				num.html(0);
				num.addClass('hide');
				console.log(num);
				layim.chat({
				  name: name //名称
				  ,type: type //聊天类型
                  ,chat_type: type //聊天类型
				  ,avatar: avatar //头像
				  ,id: openid //好友id
				  ,closeBtn:2
				})
			});
			//通讯录-群
			$(".chatGroupList").on('click', 'li', function(){
                var name = $(this).attr("name");
				var avatar = $(this).attr("avatar");
				var unitid = $(this).attr("id");
				var type =  $(this).attr("chat_type");
				layim.chat({
				  name: name //名称
				  ,type: type //聊天类型
                    ,chat_type: type //聊天类型
				  ,avatar: avatar //头像
				  ,id: unitid //好友id
				  ,closeBtn:2
				})
			})
            //通讯录-人
            $(".friend-wrapper").on('click', '.f-item ul li', function(){
                var name = $(this).attr("name");
                var avatar = $(this).attr("avatar");
                var unitid = $(this).attr("id");
                var type =  $(this).attr("chat_type");
                layim.chat({
                    name: name //名称
                    ,type: type //聊天类型
                    ,chat_type: type //聊天类型
                    ,avatar: avatar //头像
                    ,id: unitid //好友id
                    ,closeBtn:2
                })
            })
		})
	}

	function updateItem(item,index) {
        var html = '<li class="msg-item" name="'+item.name+'" avatar="'+item.avatar+'" chat_type="'+item.chat_type+'"' ;
        html += 'openid="'+item.to+'" type="friend">';
        html += '<div class="img-box"><img src="'+item.avatar+'"><span class="'+(item.num<1?"hide":"")+'">'+item.num+'</span></div>';
        html += '<div><h4>'+item.name+'</h4>';
        if(item.msg_type==2){
            html+='<p>[语音]</p>';
        }else if(item.msg_type==3){
            html+='<p>[图片]</p>';
        }else if(item.msg_type==4){
            html+='<p>[文件]</p>';
        }else {
            html+='<p>'+item.msg+'</p>';
        }
        html += '</div></li>';
        $(".chatList li").eq(index).remove();
        $(".chatList").prepend(html);
    }
	function buildItem(item) {
		var html = '<li class="msg-item" name="'+item.name+'" avatar="'+item.avatar+'" chat_type="'+item.chat_type+'"' ;
        html += 'openid="'+item.to+'" type="friend">';
        html += '<div class="img-box"><img src="'+item.avatar+'"><span class="'+(item.num<1?"hide":"")+'">'+item.num+'</span></div>';
        html += '<div><h4>'+item.name+'</h4>';
        if(item.msg_type==2){
            html+='<p>[语音]</p>';
        }else if(item.msg_type==3){
            html+='<p>[图片]</p>';
        }else if(item.msg_type==4){
            html+='<p>[文件]</p>';
        }else {
            html+='<p>'+item.msg+'</p>';
        }
        html += '</div></li>';
        $(".chatList").append(html)
    }
	$("#chat-aside-toggle").click(function(){
		$('#aside-container').toggleClass('on')
	})
})
