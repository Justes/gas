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
var g_id = [];   //群id
var u_id = [];   //用户id
var unread_msg = localStorage.getItem('unread_msg')?JSON.parse(localStorage.getItem('unread_msg')):[];
// 获取用户信息
$(function(){
    // 获取会话列表
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
     		    if(item.chat_type == 2){
                    g_id.push(item.to)
                }else {
     		        u_id.push(item.to)
                }
                item.num = 0;
     		    if(item.chat_type==1 && item.to==my_id){

                }else {
                    buildItem(item)
                }
            });
            getUnread()
        }
	});
    //获取通讯录
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
				if(data.to){        //新增群聊
                    unread_msg.push(data);
                    localStorage.setItem('unread_msg',JSON.stringify(unread_msg));
				    if(data.chat_type==2){
				        if(g_id.indexOf(data.to)>-1){
                            chatArr.forEach(function (item,index) {
                                if(data.to == item.to && item.chat_type == data.chat_type){
                                    item.num = item.num+1;
                                    item.msg = data.msg;
                                    item.msg_type = data.msg_type;
                                    chatArr.splice(index, 1);
                                    chatArr.splice(0, 0, item);
                                    updateItem(item,index)
                                }
                            });

                        }else {
                            let obj = {};
				            obj.name = JSON.parse(data.extras).gName;
                            obj.num = 0+1;
                            obj.msg =  data.name + ':' + data.msg;
                            obj.msg_type = data.msg_type;
                            obj.chat_type = data.chat_type
                            obj.avatar = 'http://gas.micyi.com/pics/images/group.png';
                            obj.to = data.to;
                            obj.user_id = data.to;
                            obj.file_url = data.file_url;
                            obj.file_name = data.file_name;
                            obj.file_ext = data.file_ext;
                            chatArr.unshift(obj);
                            g_id.unshift(data.to);
                            appendItem(obj)
                        }
                    }else {
                        if(u_id.indexOf(data.user_id)>-1){
                            chatArr.forEach(function (item,index) {
                                if(data.user_id == item.to && item.chat_type == data.chat_type){
                                    item.num = item.num+1;
                                    item.msg = data.msg;
                                    item.msg_type = data.msg_type;
                                    chatArr.splice(index, 1);
                                    chatArr.splice(0, 0, item);
                                    updateItem(item,index)
                                }
                            });
                        }else {
                            let obj = {};
                            obj.avatar = data.avatar;
                            obj.chat_type = 1;
                            obj.name = data.name;
                            obj.msg = data.msg;
                            obj.msg_type = data.msg_type;
                            obj.to = data.user_id;
                            obj.user_id = data.to;
                            obj.num = 0+1;
                            obj.file_url = data.file_url;
                            obj.file_name = data.file_name;
                            obj.file_ext = data.file_ext;
                            u_id.push(obj.to);
                            chatArr.unshift(obj)
                            appendItem(obj)
                        }
                    }
                    layim.getMessage(data);
                }
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
				layim.chat({
				  name: name //名称
				  ,type: type //聊天类型
                  ,chat_type: type //聊天类型
				  ,avatar: avatar //头像
				  ,id: openid //好友id
                  ,num:0
				  ,closeBtn:2
				});
                readMsg(openid)
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
	//更新消息列表
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
    // 添加消息
    function appendItem(item) {
        var html = '<li class="msg-item" name="'+item.name+'" avatar="'+item.avatar+'" chat_type="'+item.chat_type+'"';
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
        $(".chatList").prepend(html)
    }
	$("#chat-aside-toggle").click(function(){
		$('#aside-container').toggleClass('on')
	});
	//获取缓存里的未读消息
	function getUnread() {
        let list = localStorage.getItem('unread_msg')?JSON.parse(localStorage.getItem('unread_msg')):[];
        if(!list.length){
            return
        }
        list.forEach(function (item1,index1) {
            if(item1.chat_type==1 && item1.to == my_id) {
                chatArr.forEach(function (item,index) {
                    if (item1.oid == item.oid && item1.chat_type == item.chat_type) {
                        item.msg = item1.msg;
                        item.num += 1;
                        chatArr.splice(index, 1);
                        chatArr.splice(0, 0, item);
                        updateItem(item,index)
                    }
                })
            }else if(item1.chat_type==2){
                chatArr.forEach(function (item,index) {
                    if (item1.oid == item.oid && item1.chat_type == item.chat_type) {
                        item.msg = item1.name + ':' + item1.msg;
                        item.num += 1;
                        chatArr.splice(index, 1);
                        chatArr.splice(0, 0, item);
                        updateItem(item,index)
                    }
                })
            }
        })
    }
    // 读取会话清掉缓存
    function readMsg(val){
        var arr = localStorage.getItem('unread_msg')?JSON.parse(localStorage.getItem('unread_msg')):[];
        for(var i=arr.length-1;i>=0;i--){
            if(arr[i].chat_type==1){
                if(arr[i].user_id == val){
                    arr.splice(i,1);
                }
            }else if(arr[i].chat_type==2){
                if(arr[i].to == val){
                    arr.splice(i,1);
                }
            }
        }
        localStorage.setItem('unread_msg',JSON.stringify(arr))
    }
});
