/**

 @Name：layim v3.6.0 Pro 商用版
 @Author：贤心
 @Site：http://layim.layui.com
 @License：LGPL

 */
function getDay(t) {
    var date = t? new Date(Number(t)):new Date();
    var Y = date.getFullYear();
    var M = date.getMonth()+1;
    var d = date.getDate();
    var h =  date.getHours();
    var min = date.getMinutes();
    var s = date.getSeconds();
    var time = Y+'-'+(M<10?'0'+M:M)+'-'+(d<10?'0'+d:d)+' '+(h<10?'0'+h:h)+':'+(min<10?'0'+min:min)+':'+(s<10?'0'+s:s);
    return time;
}
var token = LA.user.token;
var my_id = LA.user.id;
var my_name = LA.user.name;
var logPage = 1;
layui.define(['layer', 'laytpl', 'upload'], function(exports){

    var v = '3.6.0 Pro';
    var $ = layui.jquery;
    var layer = layui.layer;
    var laytpl = layui.laytpl;
    var device = layui.device();

    var SHOW = 'layui-show', THIS = 'layim-this', MAX_ITEM = 20;

    //回调
    var call = {};

    //对外API
    var LAYIM = function(){
        this.v = v;
        $('body').on('click', '*[layim-event]', function(e){
            var othis = $(this), methid = othis.attr('layim-event');
            events[methid] ? events[methid].call(this, othis, e) : '';
        });
    };

    //基础配置
    LAYIM.prototype.config = function(options){
        var skin = [];
        layui.each(Array(5), function(index){
            skin.push(layui.cache.dir+'css/modules/layim/skin/'+ (index+1) +'.jpg')
        });
        options = options || {};
        options.skin = options.skin || [];
        layui.each(options.skin, function(index, item){
            skin.unshift(item);
        });
        options.skin = skin;
        options = $.extend({
            isfriend: !0
            ,isgroup: !0
            ,voice: 'default.mp3'
        }, options);
        if(!window.JSON || !window.JSON.parse) return;
        init(options);
        return this;
    };

    //监听事件
    LAYIM.prototype.on = function(events, callback){
        if(typeof callback === 'function'){
            call[events] ? call[events].push(callback) : call[events] = [callback];
        }
        return this;
    };

    //获取所有缓存数据
    LAYIM.prototype.cache = function(){
        return cache;
    };

    //打开一个自定义的会话界面
    LAYIM.prototype.chat = function(data){
        if(!window.JSON || !window.JSON.parse) return;
        return popchat(data), this;
    };

    //设置聊天界面最小化
    LAYIM.prototype.setChatMin = function(){
        return setChatMin(), this;
    };
    //
    // //设置当前会话状态
    // LAYIM.prototype.setChatStatus = function(str){
    //     var thatChat = thisChat();
    //     if(!thatChat) return;
    //     var status = thatChat.elem.find('.layim-chat-status');
    //     return status.html(str), this;
    // };

    //接受消息
    LAYIM.prototype.getMessage = function(data){
        return getMessage(data), this;
    };

    //桌面消息通知
    LAYIM.prototype.notice = function(data){
        return notice(data), this;
    };

    // //打开添加好友/群组面板
    // LAYIM.prototype.add = function(data){
    //     return popAdd(data), this;
    // };
    //
    // //好友分组面板
    // LAYIM.prototype.setFriendGroup = function(data){
    //     return popAdd(data, 'setGroup'), this;
    // };

    //消息盒子的提醒
    LAYIM.prototype.msgbox = function(nums){
        return msgbox(nums), this;
    };

    // //添加好友/群
    // LAYIM.prototype.addList = function(data){
    //     return addList(data), this;
    // };

    // //删除好友/群
    // LAYIM.prototype.removeList = function(data){
    //     return removeList(data), this;
    // };

    //设置好友在线/离线状态
    // LAYIM.prototype.setFriendStatus = function(id, type){
    //     var list = $('.layim-friend'+ id);
    //     list[type === 'online' ? 'removeClass' : 'addClass']('layim-list-gray');
    // };

    //解析聊天内容
    LAYIM.prototype.content = function(content){
        return layui.data.content(content);
    };


    //主模板
    var listTpl = function(options){
        var nodata = {
            friend: "该分组下暂无好友"
            ,group: "暂无群组"
            ,history: "暂无历史会话"
        };

        options = options || {};
        options.item = options.item || ('d.' + options.type);

        return ['{{# var length = 0; layui.each('+ options.item +', function(i, data){ length++; }}'
            ,'<li layim-event="chat" data-type="'+ options.type +'" data-index="{{ '+ (options.index||'i') +' }}" class="layim-'+ (options.type === 'history' ? '{{i}}' : options.type + '{{data.id}}') +' {{ data.status === "offline" ? "layim-list-gray" : "" }}"><img src="{{ data.avatar }}"><span>{{ data.username||data.groupname||data.name||"佚名" }}</span><p>{{ data.remark||data.sign||"" }}</p><span class="layim-msg-status">new</span></li>'
            ,'{{# }); if(length === 0){ }}'
            ,'<li class="layim-null">'+ (nodata[options.type] || "暂无数据") +'</li>'
            ,'{{# } }}'].join('');
    };

    var elemTpl = ['<div class="layui-layim-main">'
        ,'<div class="layui-layim-info">'
        ,'<div class="layui-layim-user">{{ d.mine.username }}</div>'
        ,'<div class="layui-layim-status">'
        ,'{{# if(d.mine.status === "online"){ }}'
        ,'<span class="layui-icon layim-status-online" layim-event="status" lay-type="show">&#xe617;</span>'
        ,'{{# } else if(d.mine.status === "hide") { }}'
        ,'<span class="layui-icon layim-status-hide" layim-event="status" lay-type="show">&#xe60f;</span>'
        ,'{{# } }}'
        ,'<ul class="layui-anim layim-menu-box">'
        ,'<li {{d.mine.status === "online" ? "class=layim-this" : ""}} layim-event="status" lay-type="online"><i class="layui-icon">&#xe618;</i><cite class="layui-icon layim-status-online">&#xe617;</cite>在线</li>'
        ,'<li {{d.mine.status === "hide" ? "class=layim-this" : ""}} layim-event="status" lay-type="hide"><i class="layui-icon">&#xe618;</i><cite class="layui-icon layim-status-hide">&#xe60f;</cite>隐身</li>'
        ,'</ul>'
        ,'</div>'
        //,'<input class="layui-layim-remark" placeholder="编辑签名" value="{{ d.mine.remark||d.mine.sign||"" }}">'
        ,'</div>'
        ,'<ul class="layui-unselect layui-layim-tab{{# if(!d.base.isfriend || !d.base.isgroup){ }}'
        ,' layim-tab-two'
        ,'{{# } }}">'
        ,'<li class="layui-icon'
        ,'{{# if(!d.base.isfriend){ }}'
        ,' layim-hide'
        ,'{{# } else { }}'
        ,' layim-this'
        ,'{{# } }}'
        ,'" title="联系人" layim-event="tab" lay-type="friend">&#xe612;</li>'
        ,'<li class="layui-icon'
        ,'{{# if(!d.base.isgroup){ }}'
        ,' layim-hide'
        ,'{{# } else if(!d.base.isfriend) { }}'
        ,' layim-this'
        ,'{{# } }}'
        ,'" title="群组" layim-event="tab" lay-type="group">&#xe613;</li>'
        ,'<li class="layui-icon" title="历史会话" layim-event="tab" lay-type="history">&#xe611;</li>'
        ,'</ul>'
        ,'<ul class="layui-unselect layim-tab-content {{# if(d.base.isfriend){ }}layui-show{{# } }} layim-list-friend">'
        ,'{{# layui.each(d.friend, function(index, item){ var spread = d.local["spread"+index]; }}'
        ,'<li>'
        ,'<h5 layim-event="spread" lay-type="{{ spread }}"><i class="layui-icon">{{# if(spread === "true"){ }}&#xe61a;{{# } else {  }}&#xe602;{{# } }}</i><span>{{ item.groupname||"未命名分组"+index }}</span><em>(<cite class="layim-count"> {{ (item.list||[]).length }}</cite>)</em></h5>'
        ,'<ul class="layui-layim-list {{# if(spread === "true"){ }}'
        ,' layui-show'
        ,'{{# } }}">'
        ,listTpl({
            type: "friend"
            ,item: "item.list"
            ,index: "index"
        })
        ,'</ul>'
        ,'</li>'
        ,'{{# }); if(d.friend.length === 0){ }}'
        ,'<li><ul class="layui-layim-list layui-show"><li class="layim-null">暂无联系人</li></ul>'
        ,'{{# } }}'
        ,'</ul>'
        ,'<ul class="layui-unselect layim-tab-content {{# if(!d.base.isfriend && d.base.isgroup){ }}layui-show{{# } }}">'
        ,'<li>'
        ,'<ul class="layui-layim-list layui-show layim-list-group">'
        ,listTpl({
            type: 'group'
        })
        ,'</ul>'
        ,'</li>'
        ,'</ul>'
        ,'<ul class="layui-unselect layim-tab-content  {{# if(!d.base.isfriend && !d.base.isgroup){ }}layui-show{{# } }}">'
        ,'<li>'
        ,'<ul class="layui-layim-list layui-show layim-list-history">'
        ,listTpl({
            type: 'history'
        })
        ,'</ul>'
        ,'</li>'
        ,'</ul>'
        ,'<ul class="layui-unselect layim-tab-content">'
        ,'<li>'
        ,'<ul class="layui-layim-list layui-show" id="layui-layim-search"></ul>'
        ,'</li>'
        ,'</ul>'
        ,'<ul class="layui-unselect layui-layim-tool">'
        ,'{{# if(d.base.issearch){ }}'
        ,'<li class="layui-icon layim-tool-search" layim-event="search" title="搜索">&#xe615;</li>'
        ,'{{# } }}'
        ,'{{# if(d.base.msgbox){ }}'
        ,'<li class="layui-icon layim-tool-msgbox" layim-event="msgbox" title="消息盒子">&#xe645;<span class="layui-anim"></span></li>'
        ,'{{# } }}'
        ,'{{# if(d.base.find){ }}'
        ,'<li class="layui-icon layim-tool-find" layim-event="find" title="查找">&#xe608;</li>'
        ,'{{# } }}'
        ,'{{# if(d.base.isskin){ }}'
        ,'<li class="layui-icon layim-tool-skin" layim-event="skin" title="更换背景">&#xe61b;</li>'
        ,'{{# } }}'
        ,'{{# if(!d.base.copyright){ }}'
        ,'<li class="layui-icon layim-tool-about" layim-event="about" title="关于">&#xe60b;</li>'
        ,'{{# } }}'
        ,'</ul>'
        ,'<div class="layui-layim-search"><input><label class="layui-icon" layim-event="closeSearch">&#x1007;</label></div>'
        ,'</div>'].join('');

    //换肤模版
    var elemSkinTpl = ['<ul class="layui-layim-skin">'
        ,'{{# layui.each(d.skin, function(index, item){ }}'
        ,'<li><img layim-event="setSkin" src="{{ item }}"></li>'
        ,'{{# }); }}'
        ,'<li layim-event="setSkin"><cite>简约</cite></li>'
        ,'</ul>'].join('');

    //聊天主模板
    var elemChatTpl = ['<div class="layim-chat layim-chat-{{d.data.type}}{{d.first ? " layui-show" : ""}}">'
        ,'<div class="layui-unselect layim-chat-title">'
        ,'<div class="layim-chat-other">'
        ,'<img class="layim-{{ d.data.type }}{{ d.data.id }}" src="{{ d.data.avatar }}"><span class="layim-chat-username" layim-event="{{ d.data.type==="group" ? \"groupMembers\" : \"\" }}">{{ d.data.name||"佚名" }} {{d.data.temporary ? "<cite></cite>" : ""}} {{# if(d.data.type==="group"){ }} <em class="layim-chat-members"></em><i class="layui-icon">&#xe61a;</i> {{# } }}</span>'
        ,'<p class="layim-chat-status"></p>'
        ,'</div>'
        ,'</div>'
        ,'<div class="layim-chat-main">'
        ,'<ul></ul>'
        ,'</div>'
        ,'<div class="layim-chat-footer">'
        ,'<div class="layui-unselect layim-chat-tool" data-json="{{encodeURIComponent(JSON.stringify(d.data))}}">'
        ,'<span class="layui-icon layim-tool-image" title="发送文件" layim-event="imageSend" data-type="file">&#xe61d;<input type="file" name="file" id="sendFile"></span><span class="layui-icon layim-tool-face" title="选择表情" layim-event="face">&#xe60c;</span>'
        ,'{{# if(d.base && d.base.uploadImage){ }}'
        ,'<span class="layui-icon layim-tool-image" title="上传图片" layim-event="imageSend">&#xe60d;<input type="file" name="file"></span>'
        ,'{{# }; }}'
        ,'{{# if(d.base && d.base.uploadFile){ }}'
        ,''
        ,'{{# }; }}'
        ,'{{# if(d.base && d.base.isAudio){ }}'
        ,'<span class="layui-icon layim-tool-audio" title="发送网络音频" layim-event="media" data-type="audio">&#xe6fc;</span>'
        ,'{{# }; }}'
        ,'{{# if(d.base && d.base.isVideo){ }}'
        ,'<span class="layui-icon layim-tool-video" title="发送网络视频" layim-event="media" data-type="video">&#xe6ed;</span>'
        ,'{{# }; }}'
        ,'{{# layui.each(d.base.tool, function(index, item){ }}'
        ,'<span class="layui-icon layim-tool-{{item.alias}}" title="{{item.title}}" layim-event="extend" lay-filter="{{ item.alias }}">{{item.icon}}</span>'
        ,'{{# }); }}'
        ,'{{# if(d.base && d.base.chatLog){ }}'
        ,'<span class="layim-tool-log" layim-event="chatLog"><i class="layui-icon">&#xe60e;</i>聊天记录</span>'
        ,'{{# }; }}'
        ,'</div>'
        ,'<div class="layim-chat-textarea"><textarea></textarea></div>'
        ,'<div class="layim-chat-bottom">'
        ,'<div class="layim-chat-send">'
        ,'<span class="layim-send-close" layim-event="closeThisChat">关闭</span>'
        ,'<span class="layim-send-btn" layim-event="send">发送</span>'
        ,'<span class="layim-send-set" layim-event="setSend" lay-type="show"><em class="layui-edge"></em></span>'
        ,'<ul class="layui-anim layim-menu-box">'
        ,'<li {{d.local.sendHotKey !== "Ctrl+Enter" ? "class=layim-this" : ""}} layim-event="setSend" lay-type="Enter"><i class="layui-icon">&#xe618;</i>按Enter键发送消息</li>'
        ,'<li {{d.local.sendHotKey === "Ctrl+Enter" ? "class=layim-this" : ""}} layim-event="setSend"  lay-type="Ctrl+Enter"><i class="layui-icon">&#xe618;</i>按Ctrl+Enter键发送消息</li>'
        ,'</ul>'
        ,'</div>'
        ,'</div>'
        ,'</div>'
        ,'</div>'].join('');

    //添加好友群组模版
    var elemAddTpl = ['<div class="layim-add-box">'
        ,'<div class="layim-add-img"><img class="layui-circle" src="{{ d.data.avatar }}"><p>{{ d.data.name||"" }}</p></div>'
        ,'<div class="layim-add-remark">'
        ,'{{# if(d.data.type === "friend" && d.type === "setGroup"){ }}'
        ,'<p>选择分组</p>'
        ,'{{# } if(d.data.type === "friend"){ }}'
        ,'<select class="layui-select" id="LAY_layimGroup">'
        ,'{{# layui.each(d.data.group, function(index, item){ }}'
        ,'<option value="{{ item.id }}">{{ item.groupname }}</option>'
        ,'{{# }); }}'
        ,'</select>'
        ,'{{# } }}'
        ,'{{# if(d.data.type === "group"){ }}'
        ,'<p>请输入验证信息</p>'
        ,'{{# } if(d.type !== "setGroup"){ }}'
        ,'<textarea id="LAY_layimRemark" placeholder="验证信息" class="layui-textarea"></textarea>'
        ,'{{# } }}'
        ,'</div>'
        ,'</div>'].join('');

    //聊天内容列表模版
    var elemChatMain = ['<li {{ d.user_id == my_id  ? "class=layim-chat-mine" : "" }} {{# if(d.user_id){ }}data-cid="{{d.user_id}}"{{# } }}>'
        ,'<div class="layim-chat-user"><img src="{{ d.avatar }}"><cite>'
        ,'{{# if( d.user_id == my_id){ }}'
        ,'<i>{{ d.created_at }}</i><span>{{ d.name }}</span>'
        ,'{{# } else { }}'
        ,'<span>{{ d.name }}</span><i>{{ d.created_at }}</i>'
        ,'{{# } }}'
        ,'</cite></div>'
        ,'<div class="layim-chat-text">',
        '{{# if(d.msg_type==2){ }}',
        '<div class="msg-box"><div class="voice-box" layim-event="playVoice">' +
        '     <img class="palying" src="/packages/layer/src/images/wifi-w.png" id="{{d.timestamp}}"/>' +
        '     <img class="stopping hide" src="/packages/layer/src/images/voice_play_w.gif" id="{{d.timestamp}}-0"/>' +
        '     <audio id="{{d.msgid}}" controls>' +
        '     <source src="{{d.file_url}}" type="audio/mpeg">' +
        '  </audio></div></div>',
        '{{# } else if(d.msg_type==3){ }}',
        '<div class="msg-box imgShow" layim-event="imgShow"><img src="{{ d.file_url }}"></div>',
        '{{# } else if(d.msg_type==4){ }}',
        '<div class="msg-box"><a href="{{d.file_url}}" target="_blank" class="file-msg"><img src="/packages/layer/src/images/list-file.png"><p>{{ d.file_name }}</p></a></div>',
        '{{# } else{ }}',
        '<div class="msg-box">{{ d.msg }}</div>',
        '{{# } }}',
        '</div>'
        ,'</li>'].join('');
    //聊天框左侧列表
    var elemChatList = '<li class="layim-{{ d.data.type }}{{ d.data.id }} layim-chatlist-{{ d.data.type }}{{ d.data.id }} layim-this" layim-event="tabChat" chat_type="{{d.data.chat_type}}" id="{{ d.data.id }}">' +
        '<img src="{{ d.data.avatar }}"><span>{{ d.data.name}}</span><span class="tips tips-{{d.data.num}}">{{d.data.num}}</span>' +
        '<i class="layui-icon" layim-event="closeChat">&#x1007;</i>' +
        '</li>';

    //补齐数位
    var digit = function(num){
        return num < 10 ? '0' + (num|0) : num;
    };

    //转换时间
    layui.data.date = function(timestamp){
        var d = new Date(timestamp||new Date());
        return d.getFullYear() + '-' + digit(d.getMonth() + 1) + '-' + digit(d.getDate())
            + ' ' + digit(d.getHours()) + ':' + digit(d.getMinutes()) + ':' + digit(d.getSeconds());
    };

    //转换内容
    layui.data.content = function(content){
        //支持的html标签
        var html = function(end){
            return new RegExp('\\n*\\['+ (end||'') +'(pre|div|span|p|table|thead|th|tbody|tr|td|ul|li|ol|li|dl|dt|dd|h2|h3|h4|h5)([\\s\\S]*?)\\]\\n*', 'g');
        };
        content = (content||'').replace(/&(?!#?[a-zA-Z0-9]+;)/g, '&amp;')
            .replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/'/g, '&#39;').replace(/"/g, '&quot;') //XSS
            .replace(/@(\S+)(\s+?|$)/g, '@<a href="javascript:;">$1</a>$2') //转义@

            .replace(/face\[([^\s\[\]]+?)\]/g, function(face){  //转义表情
                var alt = face.replace(/^face/g, '');
                return '<img alt="'+ alt +'" title="'+ alt +'" src="' + faces[alt] + '">';
            })
            .replace(/img\[([^\s]+?)\]/g, function(img){  //转义图片
                return '<img class="layui-layim-photos" src="' + img.replace(/(^img\[)|(\]$)/g, '') + '">';
            })
            .replace(/file\([\s\S]+?\)\[[\s\S]*?\]/g, function(str){ //转义文件
                var href = (str.match(/file\(([\s\S]+?)\)\[/)||[])[1];
                var text = (str.match(/\)\[([\s\S]*?)\]/)||[])[1];
                if(!href) return str;
                return '<a class="layui-layim-file" href="'+ href +'" download target="_blank"><i class="layui-icon">&#xe61e;</i><cite>'+ (text||href) +'</cite></a>';
            })
            .replace(/audio\[([^\s]+?)\]/g, function(audio){  //转义音频
                return '<div class="layui-unselect layui-layim-audio" layim-event="playAudio" data-src="' + audio.replace(/(^audio\[)|(\]$)/g, '') + '"><i class="layui-icon">&#xe652;</i><p>音频消息</p></div>';
            })
            .replace(/video\[([^\s]+?)\]/g, function(video){  //转义音频
                return '<div class="layui-unselect layui-layim-video" layim-event="playVideo" data-src="' + video.replace(/(^video\[)|(\]$)/g, '') + '"><i class="layui-icon">&#xe652;</i></div>';
            })

            .replace(/a\([\s\S]+?\)\[[\s\S]*?\]/g, function(str){ //转义链接
                var href = (str.match(/a\(([\s\S]+?)\)\[/)||[])[1];
                var text = (str.match(/\)\[([\s\S]*?)\]/)||[])[1];
                if(!href) return str;
                return '<a href="'+ href +'" target="_blank">'+ (text||href) +'</a>';
            }).replace(html(), '\<$1 $2\>').replace(html('/'), '\</$1\>') //转移HTML代码
            .replace(/\n/g, '<br>') //转义换行
        return content;
    };

    //Ajax
    var post = function(options, callback, tips){
        options = options || {};
        return $.ajax({
            url: options.url
            ,type: options.type || 'get'
            ,headers: options.headers || {}
            ,data: options.data
            ,dataType: options.dataType || 'json'
            ,cache: false
            ,success: function(res){
                res.code == 0
                    ? callback && callback(res.data||{})
                    : layer.msg(res.msg || ((tips||'Error') + ': LAYIM_NOT_GET_DATA'), {
                        time: 5000
                    });
            },error: function(err, msg){
                window.console && console.log && console.error('LAYIM_DATE_ERROR：' + msg);
            }
        });
    };

    //处理初始化信息
    var cache = {message: {}, chat: []}, init = function(options){
        var init = options.init || {}
        mine = init.mine || {}
            ,local = layui.data('layim')[mine.id] || {}
            ,obj = {
            base: options
            ,local: local
            ,mine: mine
            ,history: local.history || {}
        }, create = function(data){
            var mine = data.mine || {};
            var local = layui.data('layim')[mine.id] || {}, obj = {
                base: options //基础配置信息
                ,local: local //本地数据
                ,mine:  mine //我的用户信息
                ,friend: data.friend || [] //联系人信息
                ,group: data.group || [] //群组信息
                ,history: local.history || {} //历史会话信息
            };
            cache = $.extend(cache, obj);
            popim(laytpl(elemTpl).render(obj));
            if(local.close || options.min){
                popmin();
            }
            layui.each(call.ready, function(index, item){
                item && item(obj);
            });
        };
        cache = $.extend(cache, obj);
        if(options.brief){
            return layui.each(call.ready, function(index, item){
                item && item(obj);
            });
        };
        init.url ? post(init, create, 'INIT') : create(init);
    };

    //显示主面板
    var layimMain, popim = function(content){
        return layer.open({
            type: 1
            ,area: ['260px', '520px']
            ,skin: 'layui-box layui-layim'
            ,title: '&#8203;'
            ,offset: 'rb'
            ,id: 'layui-layim'
            ,shade: false
            ,anim: 2
            ,resize: false
            ,content: content
            ,success: function(layero){
                layimMain = layero;

                setSkin(layero);

                if(cache.base.right){
                    layero.css('margin-left', '-' + cache.base.right);
                }
                if(layimClose){
                    layer.close(layimClose.attr('times'));
                }

                //按最新会话重新排列
                var arr = [], historyElem = layero.find('.layim-list-history');
                historyElem.find('li').each(function(){
                    arr.push($(this).prop('outerHTML'))
                });
                if(arr.length > 0){
                    arr.reverse();
                    historyElem.html(arr.join(''));
                }

                banRightMenu();
                events.sign();
            }
            ,cancel: function(index){
                popmin();
                var local = layui.data('layim')[cache.mine.id] || {};
                local.close = true;
                layui.data('layim', {
                    key: cache.mine.id
                    ,value: local
                });
                return false;
            }
        });
    };

    //屏蔽主面板右键菜单
    var banRightMenu = function(){
        layimMain.on('contextmenu', function(event){
            event.cancelBubble = true
            event.returnValue = false;
            return false;
        });

        var hide = function(){
            layer.closeAll('tips');
        };

        //自定义历史会话右键菜单
        layimMain.find('.layim-list-history').on('contextmenu', 'li', function(e){
            var othis = $(this);
            var html = '<ul data-id="'+ othis[0].id +'" data-index="'+ othis.data('index') +'"><li layim-event="menuHistory" data-type="one">移除该会话</li><li layim-event="menuHistory" data-type="all">清空全部会话列表</li></ul>';

            if(othis.hasClass('layim-null')) return;

            layer.tips(html, this, {
                tips: 1
                ,time: 0
                ,anim: 5
                ,fixed: true
                ,skin: 'layui-box layui-layim-contextmenu'
                ,success: function(layero){
                    var stopmp = function(e){ stope(e); };
                    layero.off('mousedown', stopmp).on('mousedown', stopmp);
                }
            });
            $(document).off('mousedown', hide).on('mousedown', hide);
            $(window).off('resize', hide).on('resize', hide);

        });
    }

    //主面板最小化状态
    var layimClose, popmin = function(content){
        if(layimClose){
            layer.close(layimClose.attr('times'));
        }
        if(layimMain){
            layimMain.hide();
        }
        cache.mine = cache.mine || {};
        return layer.open({
            type: 1
            ,title: false
            ,id: 'layui-layim-close'
            ,skin: 'layui-box layui-layim-min layui-layim-close'
            ,shade: false
            ,closeBtn: false
            ,anim: 2
            ,offset: 'rb'
            ,resize: false
            ,content: '<span>'+ (content||cache.base.title||'我的LayIM') +'</span>'
            ,move: '#layui-layim-close img'
            ,success: function(layero, index){
                layimClose = layero;
                if(cache.base.right){
                    layero.css('margin-left', '-' + cache.base.right);
                }
                layero.on('click', function(){
                    layer.close(index);
                    layimMain.show();
                    var local = layui.data('layim')[cache.mine.id] || {};
                    delete local.close;
                    layui.data('layim', {
                        key: cache.mine.id
                        ,value: local
                    });
                });
            }
        });
    };

    //显示聊天面板
    var layimChat, layimMin, chatIndex, To = {}, popchat = function(data){

        data = data || {};
        var chat = $('#layui-layim-chat'), render = {
            data: data
            ,base: cache.base
            ,local: cache.local
        };
        if(!data.id){
            return layer.msg('非法用户');
        }

        if(chat[0]){
            var list = layimChat.find('.layim-chat-list');
            var listThat = list.find('.layim-chatlist-'+ data.type + data.id);
            var hasFull = layimChat.find('.layui-layer-max').hasClass('layui-layer-maxmin');
            var chatBox = chat.children('.layim-chat-box');

            //如果是最小化，则还原窗口
            if(layimChat.css('display') === 'none'){
                layimChat.show();
            }

            if(layimMin){
                layer.close(layimMin.attr('times'));
            }

            //如果出现多个聊天面板
            if(list.find('li').length === 1 && !listThat[0]){
                hasFull || layimChat.css('width', 800);
                list.css({
                    height: layimChat.height()
                }).show();
                chatBox.css('margin-left', '200px');
            }

            //打开的是非当前聊天面板，则新增面板
            if(!listThat[0]){
                list.append(laytpl(elemChatList).render(render));
                chatBox.append(laytpl(elemChatTpl).render(render));
                syncGray(data);
                resizeChat();
            }

            changeChat(list.find('.layim-chatlist-'+ data.type + data.id));
            // listThat[0] || viewChatlog();
            setHistory(data);
            hotkeySend();

            return chatIndex;
        }

        render.first = !0;

        var index = chatIndex = layer.open({
            type: 1
            ,area: '600px'
            ,skin: 'layui-box layui-layim-chat'
            ,id: 'layui-layim-chat'
            ,title: '&#8203;'
            ,shade: false
            ,maxmin: true
            ,offset: data.offset || 'auto'
            ,anim: data.anim || 0
            ,closeBtn: 1
            ,content: laytpl('<ul class="layui-unselect layim-chat-list">'+ elemChatList +'</ul><div class="layim-chat-box">' + elemChatTpl + '</div>').render(render)
            ,success: function(layero){
                layimChat = layero;

                layero.css({
                    'min-width': '500px'
                    ,'min-height': '420px'
                });

                syncGray(data);

                typeof data.success === 'function' && data.success(layero);

                hotkeySend();
                setSkin(layero);
                setHistory(data);

                viewChatlog();    ////////////////////////////////
                // showOffMessage();

                //聊天窗口的切换监听
                layui.each(call.chatChange, function(index, item){
                    item && item(thisChat());
                });

                //查看大图
                layero.on('dblclick', '.layui-layim-photos', function(){
                    var src = this.src;
                    layer.close(popchat.photosIndex);
                    layer.photos({
                        photos: {
                            data: [{
                                "alt": "大图模式",
                                "src": src
                            }]
                        }
                        ,shade: 0.01
                        ,closeBtn: 2
                        ,anim: 0
                        ,resize: false
                        ,success: function(layero, index){
                            popchat.photosIndex = index;
                        }
                    });
                });
            }
            ,full: function(layero){
                layer.style(index, {
                    width: '100%'
                    ,height: '100%'
                }, true);
                resizeChat();
            }
            ,resizing: resizeChat
            ,restore: resizeChat
            ,min: function(){
                setChatMin();
                return false;
            }
            ,end: function(){
                layer.closeAll('tips');
                layimChat = null;
            }
        });
        return index;
    };

    //同步置灰状态
    var syncGray = function(data){
        $('.layim-'+data.type+data.id).each(function(){
            if($(this).hasClass('layim-list-gray')){
                layui.layim.setFriendStatus(data.id, 'offline');
            }
        });
    };

    //重置聊天窗口大小
    var resizeChat = function(){
        var list = layimChat.find('.layim-chat-list')
            ,chatMain = layimChat.find('.layim-chat-main')
            ,chatHeight = layimChat.height();
        list.css({
            height: chatHeight
        });
        chatMain.css({
            height: chatHeight - 20 - 80 - 158
        })
    };

    //设置聊天窗口最小化 & 新消息提醒
    var setChatMin = function(newMsg){
        var thatChat = newMsg || thisChat().data, base = layui.layim.cache().base;
        if(layimChat && !newMsg){
            layimChat.hide();
        }
        layer.close(setChatMin.index);
        setChatMin.index = layer.open({
            type: 1
            ,title: false
            ,skin: 'layui-box layui-layim-min'
            ,shade: false
            ,closeBtn: false
            ,anim: thatChat.anim || 2
            ,offset: 'b'
            ,move: '#layui-layim-min'
            ,resize: false
            ,area: ['182px', '50px']
            ,content: '<img id="layui-layim-min" src="'+ thatChat.avatar +'"><span>'+ thatChat.name +'</span>'
            ,success: function(layero, index){
                if(!newMsg) layimMin = layero;

                if(base.minRight){
                    layer.style(index, {
                        left: $(window).width() - layero.outerWidth() - parseFloat(base.minRight)
                    });
                }

                layero.find('.layui-layer-content span').on('click', function(){
                    layer.close(index);
                    newMsg ? layui.each(cache.chat, function(i, item){
                        popchat(item);
                    }) : layimChat.show();
                    if(newMsg){
                        cache.chat = [];
                        chatListMore();
                    }
                });
                layero.find('.layui-layer-content img').on('click', function(e){
                    stope(e);
                });
            }
        });
    };

    //打开添加好友、群组面板、好友分组面板
    var popAdd = function(data, type){
        data = data || {};
        layer.close(popAdd.index);
        return popAdd.index = layer.open({
            type: 1
            ,area: '430px'
            ,title: {
                friend: '添加好友'
                ,group: '加入群组'
            }[data.type] || ''
            ,shade: false
            ,resize: false
            ,btn: type ? ['确认', '取消'] : ['发送申请', '关闭']
            ,content: laytpl(elemAddTpl).render({
                data: {
                    name: data.username || data.groupname
                    ,avatar: data.avatar
                    ,group: data.group || parent.layui.layim.cache().friend || []
                    ,type: data.type
                }
                ,type: type
            })
            ,yes: function(index, layero){
                var groupElem = layero.find('#LAY_layimGroup')
                    ,remarkElem = layero.find('#LAY_layimRemark')
                if(type){
                    data.submit && data.submit(groupElem.val(), index);
                } else {
                    data.submit && data.submit(groupElem.val(), remarkElem.val(), index);
                }
            }
        });
    };

    //切换聊天 ///////////////////////////////////
    var changeChat = function(elem, del){
        var chat_type = elem.attr('chat_type');
        elem = elem || $('.layim-chat-list .' + THIS);
        var index = elem.index() === -1 ? 0 : elem.index();
        var str = '.layim-chat', cont = layimChat.find(str).eq(index);
        var hasFull = layimChat.find('.layui-layer-max').hasClass('layui-layer-maxmin');

        if(del){
            //如果关闭的是当前聊天，则切换聊天焦点
            if(elem.hasClass(THIS)){
                changeChat(index === 0 ? elem.next() : elem.prev());
            }

            var length = layimChat.find(str).length;

            //关闭聊天界面
            if(length === 1){
                return layer.close(chatIndex);
            }

            elem.remove();
            cont.remove();

            //只剩下1个列表，隐藏左侧区块
            if(length === 2){
                layimChat.find('.layim-chat-list').hide();
                if(!hasFull){
                    layimChat.css('width', '600px');
                }
                layimChat.find('.layim-chat-box').css('margin-left', 0);
            }

            return false;
        }

        elem.addClass(THIS).siblings().removeClass(THIS);
        cont.addClass(SHOW).siblings(str).removeClass(SHOW);
        cont.find('textarea').focus();

        //聊天窗口的切换监听
        layui.each(call.chatChange, function(index, item){
            item && item(thisChat());
        });
        viewChatlog()
        // showOffMessage(chat_type);
    };

    //展示存在队列中的消息
    var showOffMessage = function(type){
        var thatChat = thisChat();
        // var message = cache.message[thatChat.data.type + thatChat.data.id];
        // if(message){
        //     //展现后，删除队列中消息
        //     delete cache.message[thatChat.data.type + thatChat.data.id];
        // }
        var local = layui.data('layim')[cache.mine.id] || {}
            , chatlog = local.chatlog || {}
            ,ul = thatChat.elem.find('.layim-chat-main ul');
        var data = {
            page:1,
        };
        if(thatChat.data.type==1){
            data.user_id = thatChat.data.id
        }else{
            data.room_id = thatChat.data.id
        }
        var url = '/api/imsg';
        $.ajax({
            url: url,
            data: data,
            headers: { token: token },
            type: "GET",
            success: function(res) {
                var loglist = res.data;
                if(loglist){
                    layui.each(loglist, function(index, item){
                        ul.prepend(laytpl(elemChatMain).render(item));
                    });
                    var mainBox = ul.parent(".layim-chat-main");
                    mainBox.scrollTop( ul.height() );
                }
            }
        });
        chatListMore();

    };

    //获取当前聊天面板
    var thisChat = function(){
        if(!layimChat) return;
        var index = $('.layim-chat-list .' + THIS).index();
        var cont = layimChat.find('.layim-chat').eq(index);
        var to = JSON.parse(decodeURIComponent(cont.find('.layim-chat-tool').data('json')));
        return {
            elem: cont
            ,data: to
            ,textarea: cont.find('textarea')
        };
    };

    //记录初始背景
    var setSkin = function(layero){
        var local = layui.data('layim')[cache.mine.id] || {}
            ,skin = local.skin;
        layero.css({
            'background-image': skin ? 'url('+ skin +')' : function(){
                return cache.base.initSkin
                    ? 'url('+ (layui.cache.dir+'css/modules/layim/skin/'+ cache.base.initSkin) +')'
                    : 'none';
            }()
        });
    };

    //记录历史会话
    var setHistory = function(data){
        var local = layui.data('layim')[cache.mine.id] || {};
        var obj = {}, history = local.history || {};
        var is = history[data.type + data.id];

        if(!layimMain) return;

        var historyElem = layimMain.find('.layim-list-history');

        data.historyTime = new Date().getTime();
        history[data.type + data.id] = data;

        local.history = history;

        layui.data('layim', {
            key: cache.mine.id
            ,value: local
        });

        if(is) return;

        obj[data.type + data.id] = data;
        var historyList = laytpl(listTpl({
            type: 'history'
            ,item: 'd.data'
        })).render({data: obj});
        historyElem.prepend(historyList);
        historyElem.find('.layim-null').remove();
    };

    //发送消息
    var sendMessage = function(file_url,file_name,file_ext){
        var msg_type = 1;
        if(file_ext){
            if(file_ext == 'png' || file_ext == 'jpg' || file_ext == 'jpeg' ||file_ext == 'bmp' || file_ext == 'gif'){
                msg_type = 3;
            }else {
                msg_type = 4
            }
        }else {
            msg_type = 1
        }
        var data = {
            username: cache.mine ? cache.mine.username : '访客'
            ,avatar: cache.mine ? cache.mine.avatar : (layui.cache.dir+'css/pc/layim/skin/logo.jpg')
            ,id: cache.mine ? cache.mine.id : null
            ,mine: true
        };
        var thatChat = thisChat(), ul = thatChat.elem.find('.layim-chat-main ul');
        var maxLength = 1000;
        data.content = thatChat.textarea.val();
        if(data.content=='' && !file_url){
            return layer.msg('不能发送空白消息');
            return false;
        }
        if(data.content.length > maxLength){
            return layer.msg('内容最长不能超过'+ maxLength +'个字符')
        }
        var param = {
            user_id: my_id
            ,to: thatChat.data
        }, message = {
            name: my_name
            ,avatar: data.avatar
            ,id: thatChat.data.id
            ,type: thatChat.data.type
            ,msg: data.content
            ,user_id:my_id
            ,created_at:getDay()
            ,file_url:file_url?file_url:''
            ,file_name:file_name?file_name:''
            ,file_ext:file_ext?file_ext:''
            ,msg_type:msg_type
        };
        //传递msg去soket.js
        pushChatlog(message);
        ul.append(laytpl(elemChatMain).render(message));
        var mainBox = ul.parent(".layim-chat-main");
        mainBox.scrollTop( ul.height() );
        layui.each(call.sendMessage, function(index, item){
            item && item(message);
        });
        chatListMore();
        thatChat.textarea.val('').focus();
    };

    //桌面消息提醒
    // var notice = function(data){
    //     data = data || {};
    //     if (window.Notification){
    //         if(Notification.permission === 'granted'){
    //             var notification = new Notification(data.title||'', {
    //                 body: data.content||''
    //                 ,icon: data.avatar||'/Public/base/images/user.png'
    //             });
    //         }else {
    //             Notification.requestPermission();
    //         };
    //     }
    // };

    // //消息声音提醒
    // var voice = function() {
    //     if(device.ie && device.ie < 9) return;
    //     var audio = document.createElement("audio");
    //     audio.src = layui.cache.dir+'css/modules/layim/voice/'+ cache.base.voice;
    //     audio.play();
    // };
    //
    // //接受消息
    var messageNew = {}, getMessage = function(data){
        console.log('layim收到消息'+JSON.stringify(data));
        var  message = {
            name: data.name
            ,avatar: data.avatar
            ,id: data.user_id
            ,type: data.type
            ,msg: data.msg
            ,user_id:data.user_id
            ,created_at:getDay(data.msgid)
            ,file_url:data.file_url
            ,file_name:data.file_name
            ,file_ext:data.file_ext
            ,msg_type:data.msg_type
        };
        var thatChat = thisChat();
        data = data || {};
        if(data.oid == thatChat.data.id){
            var  ul = thatChat.elem.find('.layim-chat-main ul');
            ul.append(laytpl(elemChatMain).render(message));
            var mainBox = ul.parent(".layim-chat-main");
            mainBox.scrollTop( ul.height() );
        }else {         //聊天窗口右侧列表插入信息提示
            var left = $(".layim-chat-list");
            left.children('li').each(function(){
                var id = $(this).attr('id');
                console.log(id);
                if(id == data.oid){
                    var tips = $(this).children('.tips');
                    var val = tips.text();
                    tips.removeClass('tips-0');
                    tips.text(Number(val)+1);
                }
            });
        }


    //     var elem = $('.layim-chatlist-'+ data.type + data.id);
    //     var group = {}, index = elem.index();
    //
    //     data.timestamp = data.timestamp || new Date().getTime();
    //     if(data.fromid == cache.mine.id){
    //         data.mine = true;
    //     }
    //     data.system || pushChatlog(data);
    //     messageNew = JSON.parse(JSON.stringify(data));
    //
    //     if(cache.base.voice){
    //         voice();
    //     }
    //
    //     if((!layimChat && data.content) || index === -1){
    //         if(cache.message[data.type + data.id]){
    //             cache.message[data.type + data.id].push(data)
    //         } else {
    //             cache.message[data.type + data.id] = [data];
    //
    //             //记录聊天面板队列
    //             if(data.type === 'friend'){
    //                 var friend;
    //                 layui.each(cache.friend, function(index1, item1){
    //                     layui.each(item1.list, function(index, item){
    //                         if(item.id == data.id){
    //                             item.type = 'friend';
    //                             item.name = item.username;
    //                             cache.chat.push(item);
    //                             return friend = true;
    //                         }
    //                     });
    //                     if(friend) return true;
    //                 });
    //                 if(!friend){
    //                     data.name = data.username;
    //                     data.temporary = true; //临时会话
    //                     cache.chat.push(data);
    //                 }
    //             } else if(data.type === 'group'){
    //                 var isgroup;
    //                 layui.each(cache.group, function(index, item){
    //                     if(item.id == data.id){
    //                         item.type = 'group';
    //                         item.name = item.groupname;
    //                         cache.chat.push(item);
    //                         return isgroup = true;
    //                     }
    //                 });
    //                 if(!isgroup){
    //                     data.name = data.groupname;
    //                     cache.chat.push(data);
    //                 }
    //             } else {
    //                 data.name = data.name || data.username || data.groupname;
    //                 cache.chat.push(data);
    //             }
    //         }
    //         if(data.type === 'group'){
    //             layui.each(cache.group, function(index, item){
    //                 if(item.id == data.id){
    //                     group.avatar = item.avatar;
    //                     return true;
    //                 }
    //             });
    //         }
    //         if(!data.system){
    //             if(cache.base.notice){
    //                 notice({
    //                     title: '来自 '+ data.username +' 的消息'
    //                     ,content: data.content
    //                     ,avatar: group.avatar || data.avatar
    //                 });
    //             }
    //             return setChatMin({
    //                 name: '收到新消息'
    //                 ,avatar: group.avatar || data.avatar
    //                 ,anim: 6
    //             });
    //         }
    //     }
    //
    //     if(!layimChat) return;
    //
    //     //接受到的消息不在当前Tab
    //     var thatChat = thisChat();
    //     if(thatChat.data.type + thatChat.data.id !== data.type + data.id){
    //         elem.addClass('layui-anim layer-anim-06');
    //         setTimeout(function(){
    //             elem.removeClass('layui-anim layer-anim-06')
    //         }, 300);
    //     }
    //
    //     var cont = layimChat.find('.layim-chat').eq(index);
    //     var ul = cont.find('.layim-chat-main ul');
    //
    //     //系统消息
    //     if(data.system){
    //         if(index !== -1){
    //             ul.append('<li class="layim-chat-system"><span>'+ data.content +'</span></li>');
    //         }
    //     } else if(data.content.replace(/\s/g, '') !== ''){
    //         ul.prepend(laytpl(elemChatMain).render(data));
    //     }
    //
    //     chatListMore();
    };
    //
    // //消息盒子的提醒
    // var ANIM_MSG = 'layui-anim-loop layer-anim-05', msgbox = function(num){
    //     var msgboxElem = layimMain.find('.layim-tool-msgbox');
    //     msgboxElem.find('span').addClass(ANIM_MSG).html(num);
    // };

    //存储最近MAX_ITEM条聊天记录到本地
    var pushChatlog = function(message){
        var local = layui.data('layim')[cache.mine.id] || {};
        local.chatlog = local.chatlog || {};
        var thisChatlog = local.chatlog[message.type + message.id];
        if(thisChatlog){
            //避免浏览器多窗口时聊天记录重复保存
            var nosame;
            layui.each(thisChatlog, function(index, item){
                if((item.timestamp === message.timestamp
                    && item.type === message.type
                    && item.id === message.id
                    && item.content === message.content)){
                    nosame = true;
                }
            });
            if(!(nosame || message.fromid == cache.mine.id)){
                thisChatlog.push(message);
            }
            if(thisChatlog.length > MAX_ITEM){
                thisChatlog.shift();
            }
        } else {
            local.chatlog[message.type + message.id] = [message];
        }
        layui.data('layim', {
            key: cache.mine.id
            ,value: local
        });
    };

    //渲染本地最新聊天记录到相应面板
    var viewChatlog = function(){
        var local = layui.data('layim')[cache.mine.id] || {}
            ,thatChat = thisChat(), chatlog = local.chatlog || {}
            ,ul = thatChat.elem.find('.layim-chat-main ul');
        ul.html('');
        console.log('当前的聊天id是'+thatChat.data.id);
        //清空未读提示和未读缓存
        var left = $(".layim-chat-list");
        left.children('li').each(function(){
            var id = $(this).attr('id');
            if(id == thatChat.data.id){
                var tips = $(this).children('.tips');
                tips.addClass('tips-0');
                tips.text(0);
            }
        });
        var arr = localStorage.getItem('unread_msg')?JSON.parse(localStorage.getItem('unread_msg')):[];
        for(var i=arr.length-1;i>=0;i--){
            if(arr[i].chat_type==1){
                if(arr[i].user_id == thatChat.data.id){
                    arr.splice(i,1);
                }
            }else if(arr[i].chat_type==2){
                if(arr[i].to == thatChat.data.id){
                    arr.splice(i,1);
                }
            }
        }
        localStorage.setItem('unread_msg',JSON.stringify(arr));
        // if(chatlog[thatChat.data.type + thatChat.data.id]){
        //     layui.each(chatlog[thatChat.data.type + thatChat.data.id], function(index, item){
        //         ul.prepend(laytpl(elemChatMain).render(item));
        //     });
        // }else{
        //
        // }
        //取得在线聊天记录
        var data = {
            page:1,
        };
        if(thatChat.data.type==1){
            data.user_id = thatChat.data.id
        }else{
            data.room_id = thatChat.data.id
        }
        var url = '/api/imsg';
        $.ajax({
            url: url,
            data: data,
            headers: { token: token },
            type: "GET",
            success: function(res) {
                var loglist = res.data;
                if(loglist){
                    layui.each(loglist, function(index, item){
                        ul.prepend(laytpl(elemChatMain).render(item));
                    });
                    var mainBox = ul.parent(".layim-chat-main");
                    mainBox.scrollTop( ul.height() );
                }
            }
        });
        chatListMore();
    };

    //添加好友或群
    // var addList = function(data){
    //     var obj = {}, has, listElem = layimMain.find('.layim-list-'+ data.type);
    //
    //     if(cache[data.type]){
    //         if(data.type === 'friend'){
    //             layui.each(cache.friend, function(index, item){
    //                 if(data.groupid == item.id){
    //                     //检查好友是否已经在列表中
    //                     layui.each(cache.friend[index].list, function(idx, itm){
    //                         if(itm.id == data.id){
    //                             return has = true
    //                         }
    //                     });
    //                     if(has) return layer.msg('好友 ['+ (data.username||'') +'] 已经存在列表中',{anim: 6});
    //                     cache.friend[index].list = cache.friend[index].list || [];
    //                     obj[cache.friend[index].list.length] = data;
    //                     data.groupIndex = index;
    //                     cache.friend[index].list.push(data); //在cache的friend里面也增加好友
    //                     return true;
    //                 }
    //             });
    //         } else if(data.type === 'group'){
    //             //检查群组是否已经在列表中
    //             layui.each(cache.group, function(idx, itm){
    //                 if(itm.id == data.id){
    //                     return has = true
    //                 }
    //             });
    //             if(has) return layer.msg('您已是 ['+ (data.groupname||'') +'] 的群成员',{anim: 6});
    //             obj[cache.group.length] = data;
    //             cache.group.push(data);
    //         }
    //     }
    //
    //     if(has) return;
    //
    //     var list = laytpl(listTpl({
    //         type: data.type
    //         ,item: 'd.data'
    //         ,index: data.type === 'friend' ? 'data.groupIndex' : null
    //     })).render({data: obj});
    //
    //     if(data.type === 'friend'){
    //         var li = listElem.find('>li').eq(data.groupIndex);
    //         li.find('.layui-layim-list').append(list);
    //         li.find('.layim-count').html(cache.friend[data.groupIndex].list.length); //刷新好友数量
    //         //如果初始没有好友
    //         if(li.find('.layim-null')[0]){
    //             li.find('.layim-null').remove();
    //         }
    //     } else if(data.type === 'group'){
    //         listElem.append(list);
    //         //如果初始没有群组
    //         if(listElem.find('.layim-null')[0]){
    //             listElem.find('.layim-null').remove();
    //         }
    //     }
    // };
    //
    // //移出好友或群
    // var removeList = function(data){
    //     var listElem = layimMain.find('.layim-list-'+ data.type);
    //     var obj = {};
    //     if(cache[data.type]){
    //         if(data.type === 'friend'){
    //             layui.each(cache.friend, function(index1, item1){
    //                 layui.each(item1.list, function(index, item){
    //                     if(data.id == item.id){
    //                         var li = listElem.find('>li').eq(index1);
    //                         var list = li.find('.layui-layim-list>li');
    //                         li.find('.layui-layim-list>li').eq(index).remove();
    //                         cache.friend[index1].list.splice(index, 1); //从cache的friend里面也删除掉好友
    //                         li.find('.layim-count').html(cache.friend[index1].list.length); //刷新好友数量
    //                         //如果一个好友都没了
    //                         if(cache.friend[index1].list.length === 0){
    //                             li.find('.layui-layim-list').html('<li class="layim-null">该分组下已无好友了</li>');
    //                         }
    //                         return true;
    //                     }
    //                 });
    //             });
    //         } else if(data.type === 'group'){
    //             layui.each(cache.group, function(index, item){
    //                 if(data.id == item.id){
    //                     listElem.find('>li').eq(index).remove();
    //                     cache.group.splice(index, 1); //从cache的group里面也删除掉数据
    //                     //如果一个群组都没了
    //                     if(cache.group.length === 0){
    //                         listElem.html('<li class="layim-null">暂无群组</li>');
    //                     }
    //                     return true;
    //                 }
    //             });
    //         }
    //     }
    // };

    //查看更多记录
    var chatListMore = function(){
        var thatChat = thisChat(), chatMain = thatChat.elem.find('.layim-chat-main');
        var ul = chatMain.find('ul');
        var length = ul.find('li').length;

        if(length >= MAX_ITEM){
            var first = ul.find('li').eq(0);
            if(!ul.prev().hasClass('layim-chat-system')){
                ul.before('<div class="layim-chat-system"><span layim-event="chatLog">查看更多记录</span></div>');
            }
            if(length > MAX_ITEM){
                first.remove();
            }
        }
        chatMain.scrollTop(chatMain[0].scrollHeight + 1000);
        chatMain.find('ul li:last').find('img').load(function(){
            chatMain.scrollTop(chatMain[0].scrollHeight+1000);
        });
    };

    //快捷键发送
    var hotkeySend = function(){
        var thatChat = thisChat(), textarea = thatChat.textarea;
        textarea.focus();
        textarea.off('keydown').on('keydown', function(e){
            var local = layui.data('layim')[cache.mine.id] || {};
            var keyCode = e.keyCode;
            if(local.sendHotKey === 'Ctrl+Enter'){
                if(e.ctrlKey && keyCode === 13){
                    sendMessage();
                }
                return;
            }
            if(keyCode === 13){
                if(e.ctrlKey){
                    return textarea.val(textarea.val()+'\n');
                }
                if(e.shiftKey) return;
                e.preventDefault();
                sendMessage();
            }
        });
    };

    //表情库
    var faces = function(){
        // var alt = ["[微笑]", "[嘻嘻]", "[哈哈]", "[可爱]", "[可怜]", "[挖鼻]", "[吃惊]", "[害羞]", "[挤眼]", "[闭嘴]", "[鄙视]", "[爱你]", "[泪]", "[偷笑]", "[亲亲]", "[生病]", "[太开心]", "[白眼]", "[右哼哼]", "[左哼哼]", "[嘘]", "[衰]", "[委屈]", "[吐]", "[哈欠]", "[抱抱]", "[怒]", "[疑问]", "[馋嘴]", "[拜拜]", "[思考]", "[汗]", "[困]", "[睡]", "[钱]", "[失望]", "[酷]", "[色]", "[哼]", "[鼓掌]", "[晕]", "[悲伤]", "[抓狂]", "[黑线]", "[阴险]", "[怒骂]", "[互粉]", "[心]", "[伤心]", "[猪头]", "[熊猫]", "[兔子]", "[ok]", "[耶]", "[good]", "[NO]", "[赞]", "[来]", "[弱]", "[草泥马]", "[神马]", "[囧]", "[浮云]", "[给力]", "[围观]", "[威武]", "[奥特曼]", "[礼物]", "[钟]", "[话筒]", "[蜡烛]", "[蛋糕]"], arr = {};
        // layui.each(alt, function(index, item){
        //     arr[item] = layui.cache.dir + 'images/face/'+ index + '.gif';
        // });
        // return arr;
        var arr = [];
        $.getJSON("/packages/layer/src/images/emojis.json", function (data){
            for (let i in data) {
                arr.push(data[i].char);
            }
        });
        return arr;
    }();


    var stope = layui.stope; //组件事件冒泡

    //在焦点处插入内容
    var focusInsert = function(obj, str){
        var result, val = obj.value;
        obj.focus();
        if(document.selection){ //ie
            result = document.selection.createRange();
            document.selection.empty();
            result.text = str;
        } else {
            result = [val.substring(0, obj.selectionStart), str, val.substr(obj.selectionEnd)];
            obj.focus();
            obj.value = result.join('');
        }
    };
    //获取更多聊天记录
    var getMoreLogPage = function () {
        logPage = logPage + 1;
        var thatChat = thisChat();
        var data = {
            page:logPage,
        };
        console.log(logPage)
        if(thatChat.data.type==1){
            data.user_id = thatChat.data.id
        }else{
            data.room_id = thatChat.data.id
        }
        var url = '/api/imsg';
        $.ajax({
            url: url,
            data: data,
            headers: { token: token },
            type: "GET",
            success: function(res) {
                var loglist = res.data;
                if(loglist){
                    loglist.forEach(function (item,index) {
                        var html = '';
                        if(item.user_id == my_id){
                            html += '<li class="layim-chat-mine">';
                            html += '<div class="layim-chat-user">';
                            html += '<img src="'+item.avatar+'">';
                            html += '<cite><i>'+item.updated_at+'</i><span>'+item.name+'</span></cite>'
                        } else{
                            html += '<li>';
                            html += '<div class="layim-chat-user">';
                            html += '<img src="'+item.avatar+'">';
                            html +=  '<cite><span>'+item.name+'</span><i>'+item.updated_at+'</i></cite>'
                        }
                        html +=  '</div><div class="layim-chat-text">';
                        html += '<div class="msg-box">'+item.msg+'</div>';
                        html += '</div>';
                        html += '</li>';
                        $('.chat-log-more ul').prepend(html);
                    });
                    var ele = $(".chat-log-more");
                    ele[0].scrollTop = ele[0].scrollHeight/2;
                }
            }
        });
    };
    var getMoreLog = function (page) {
        var thatChat = thisChat();
        var data = {
            page:page,
        };
        if(thatChat.data.type==1){
            data.user_id = thatChat.data.id
        }else{
            data.room_id = thatChat.data.id
        }
        var url = '/api/imsg';
        $.ajax({
            url: url,
            data: data,
            headers: { token: token },
            type: "GET",
            success: function(res) {
                var loglist = res.data;
                if(loglist){
                    loglist.forEach(function (item,index) {
                        var html = '';
                        if(item.user_id == my_id){
                            html += '<li class="layim-chat-mine">';
                            html += '<div class="layim-chat-user">';
                            html += '<img src="'+item.avatar+'">';
                            html += '<cite><i>'+item.updated_at+'</i><span>'+item.name+'</span></cite>'
                        } else{
                            html += '<li>';
                            html += '<div class="layim-chat-user">';
                            html += '<img src="'+item.avatar+'">';
                            html +=  '<cite><span>'+item.name+'</span><i>'+item.updated_at+'</i></cite>'
                        }
                        html +=  '</div><div class="layim-chat-text">';
                        if(item.msg_type==2){
                            html +='<div class="msg-box"><div class="voice-box" layim-event="playVoice">' +
                            '<img class="palying" src="/packages/layer/src/images/wifi-w.png"/></div></div>'+
                            '<img class="stopping hide" src="/packages/layer/src/images/voice_play_w.gif" id="'+item.timestamp+'-0"/>' +
                            '<audio id="'+item.msgid+'" controls>' +
                            '<source src="'+item.file_url+'" type="audio/mpeg">' +
                            '</audio></div></div>';
                        }else if(item.msg_type==3){
                           html += '<div class="msg-box imgShow" layim-event="imgShow"><img src="'+item.file_url+'"></div>'
                        }else if(item.msg_type==4){
                            html +='<div class="msg-box"><a href="'+item.file_url+'" target="_blank" class="file-msg"><img src="/packages/layer/src/images/list-file.png"><p>'+ item.file_name +'</p></a></div>'
                        }else {
                            html += '<div class="msg-box">'+item.msg+'</div>';
                        }

                        html += '</div>';
                        html += '</li>';
                        $('.chat-log-more ul').prepend(html);
                    })
                    var ele = $(".chat-log-more");
                    ele[0].scrollTop = ele[0].scrollHeight;

                    $('.chat-log-more').scroll(function() {
                        var scrollTop = $(this).scrollTop(); // 滚动条距离顶部的高度
                        var scrollHeight = $(document).height(); // 当前页面的总高度
                        var clientHeight = $(this).height(); // 当前可视的页面高度
                        if (scrollTop + clientHeight >= scrollHeight) {
                        } else if (scrollTop <= 0) {
                            getMoreLogPage()
                        }
                    });

                }
            }
        });
    }
    //事件
    var anim = 'layui-anim-upbit', events = {
        //在线状态
        status: function(othis, e){
            var hide = function(){
                othis.next().hide().removeClass(anim);
            };
            var type = othis.attr('lay-type');
            if(type === 'show'){
                stope(e);
                othis.next().show().addClass(anim);
                $(document).off('click', hide).on('click', hide);
            } else {
                var prev = othis.parent().prev();
                othis.addClass(THIS).siblings().removeClass(THIS);
                prev.html(othis.find('cite').html());
                prev.removeClass('layim-status-'+(type === 'online' ? 'hide' : 'online'))
                    .addClass('layim-status-'+type);
                layui.each(call.online, function(index, item){
                    item && item(type);
                });
            }
        }

        //编辑签名
        ,sign: function(){
            var input = layimMain.find('.layui-layim-remark');
            input.on('change', function(){
                var value = this.value;
                layui.each(call.sign, function(index, item){
                    item && item(value);
                });
            });
            input.on('keyup', function(e){
                var keyCode = e.keyCode;
                if(keyCode === 13){
                    this.blur();
                }
            });
        }

        //大分组切换
        ,tab: function(othis){
            var index, main = '.layim-tab-content';
            var tabs = layimMain.find('.layui-layim-tab>li');
            typeof othis === 'number' ? (
                index = othis
                    ,othis = tabs.eq(index)
            ) : (
                index = othis.index()
            );
            index > 2 ? tabs.removeClass(THIS) : (
                events.tab.index = index
                    ,othis.addClass(THIS).siblings().removeClass(THIS)
            )
            layimMain.find(main).eq(index).addClass(SHOW).siblings(main).removeClass(SHOW);
        }

        //展开联系人分组
        ,spread: function(othis){
            var type = othis.attr('lay-type');
            var spread = type === 'true' ? 'false' : 'true';
            var local = layui.data('layim')[cache.mine.id] || {};
            othis.next()[type === 'true' ? 'removeClass' : 'addClass'](SHOW);
            local['spread' + othis.parent().index()] = spread;
            layui.data('layim', {
                key: cache.mine.id
                ,value: local
            });
            othis.attr('lay-type', spread);
            othis.find('.layui-icon').html(spread === 'true' ? '&#xe61a;' : '&#xe602;');
        }

        //搜索
        ,search: function(othis){
            var search = layimMain.find('.layui-layim-search');
            var main = layimMain.find('#layui-layim-search');
            var input = search.find('input'), find = function(e){
                var val = input.val().replace(/\s/);
                if(val === ''){
                    events.tab(events.tab.index|0);
                } else {
                    var data = [], friend = cache.friend || [];
                    var group = cache.group || [], html = '';
                    for(var i = 0; i < friend.length; i++){
                        for(var k = 0; k < (friend[i].list||[]).length; k++){
                            if(friend[i].list[k].username.indexOf(val) !== -1){
                                friend[i].list[k].type = 'friend';
                                friend[i].list[k].index = i;
                                friend[i].list[k].list = k;
                                data.push(friend[i].list[k]);
                            }
                        }
                    }
                    for(var j = 0; j < group.length; j++){
                        if(group[j].groupname.indexOf(val) !== -1){
                            group[j].type = 'group';
                            group[j].index = j;
                            group[j].list = j;
                            data.push(group[j]);
                        }
                    }
                    if(data.length > 0){
                        for(var l = 0; l < data.length; l++){
                            html += '<li layim-event="chat" data-type="'+ data[l].type +'" data-index="'+ data[l].index +'" data-list="'+ data[l].list +'"><img src="'+ data[l].avatar +'"><span>'+ (data[l].username || data[l].groupname || '佚名') +'</span><p>'+ (data[l].remark||data[l].sign||'') +'</p></li>';
                        }
                    } else {
                        html = '<li class="layim-null">无搜索结果</li>';
                    }
                    main.html(html);
                    events.tab(3);
                }
            };
            if(!cache.base.isfriend && cache.base.isgroup){
                events.tab.index = 1;
            } else if(!cache.base.isfriend && !cache.base.isgroup){
                events.tab.index = 2;
            }
            search.show();
            input.focus();
            input.off('keyup', find).on('keyup', find);
        }

        //关闭搜索
        ,closeSearch: function(othis){
            othis.parent().hide();
            events.tab(events.tab.index|0);
        }

        //消息盒子
        ,msgbox: function(){
            var msgboxElem = layimMain.find('.layim-tool-msgbox');
            layer.close(events.msgbox.index);
            msgboxElem.find('span').removeClass(ANIM_MSG).html('');
            return events.msgbox.index = layer.open({
                type: 2
                ,title: '消息盒子'
                ,shade: false
                ,maxmin: true
                ,area: ['600px', '520px']
                ,skin: 'layui-box layui-layer-border'
                ,resize: false
                ,content: cache.base.msgbox
            });
        }

        //弹出查找页面
        ,find: function(){
            layer.close(events.find.index);
            return events.find.index = layer.open({
                type: 2
                ,title: '查找'
                ,shade: false
                ,maxmin: true
                ,area: ['1000px', '520px']
                ,skin: 'layui-box layui-layer-border'
                ,resize: false
                ,content: cache.base.find
            });
        }

        //弹出更换背景
        ,skin: function(){
            layer.open({
                type: 1
                ,title: '更换背景'
                ,shade: false
                ,area: '300px'
                ,skin: 'layui-box layui-layer-border'
                ,id: 'layui-layim-skin'
                ,zIndex: 66666666
                ,resize: false
                ,content: laytpl(elemSkinTpl).render({
                    skin: cache.base.skin
                })
            });
        }

        //关于
        ,about: function(){
            layer.alert('版本： '+ v + '<br>版权所有：<a href="http://layim.layui.com" target="_blank">layim.layui.com</a>', {
                title: '关于 LayIM'
                ,shade: false
            });
        }

        //生成换肤
        ,setSkin: function(othis){
            var src = othis.attr('src');
            var local = layui.data('layim')[cache.mine.id] || {};
            local.skin = src;
            if(!src) delete local.skin;
            layui.data('layim', {
                key: cache.mine.id
                ,value: local
            });
            try{
                layimMain.css({
                    'background-image': src ? 'url('+ src +')' : 'none'
                });
                layimChat.css({
                    'background-image': src ? 'url('+ src +')' : 'none'
                });
            } catch(e) {}
            layui.each(call.setSkin, function(index, item){
                var filename = (src||'').replace(layui.cache.dir+'css/modules/layim/skin/', '');
                item && item(filename, src);
            });
        }

        //弹出聊天面板
        ,chat: function(othis){
            var local = layui.data('layim')[cache.mine.id] || {};
            var type = othis.data('type'), index = othis.data('index');
            var list = othis.attr('data-list') || othis.index(), data = {};
            if(type === 'friend'){
                data = cache[type][index].list[list];
            } else if(type === 'group'){
                data = cache[type][list];
            } else if(type === 'history'){
                data = (local.history || {})[index] || {};
            }
            data.name = data.name || data.username || data.groupname;
            if(type !== 'history'){
                data.type = type;
            }
            popchat(data);
        }

        //切换聊天
        ,tabChat: function(othis){
            changeChat(othis);
        }
        //关闭聊天列表
        ,closeChat: function(othis, e){
            changeChat(othis.parent(), 1);
            stope(e);
        }, closeThisChat: function(){
            changeChat(null, 1);
        }

        //展开群组成员
        ,groupMembers: function(othis, e){
            var icon = othis.find('.layui-icon'), hide = function(){
                icon.html('&#xe61a;');
                othis.data('down', null);
                layer.close(events.groupMembers.index);
            }, stopmp = function(e){stope(e)};

            if(othis.data('down')){
                hide();
            } else {
                icon.html('&#xe619;');
                othis.data('down', true);
                events.groupMembers.index = layer.tips('<ul class="layim-members-list"></ul>', othis, {
                    tips: 3
                    ,time: 0
                    ,anim: 5
                    ,fixed: true
                    ,skin: 'layui-box layui-layim-members'
                    ,success: function(layero){
                        var members = cache.base.members || {}, thatChat = thisChat()
                            ,ul = layero.find('.layim-members-list'), li = '', membersCache = {}
                            ,hasFull = layimChat.find('.layui-layer-max').hasClass('layui-layer-maxmin')
                            ,listNone = layimChat.find('.layim-chat-list').css('display') === 'none';
                        if(hasFull){
                            ul.css({
                                width: $(window).width() - 22 - (listNone || 200)
                            });
                        }
                        members.data = $.extend(members.data, {
                            id: thatChat.data.id
                        });
                        post(members, function(res){
                            layui.each(res.list, function(index, item){
                                li += '<li data-uid="'+ item.id +'"><a href="javascript:;"><img src="'+ item.avatar +'"><cite>'+ item.username +'</cite></a></li>';
                                membersCache[item.id] = item;
                            });
                            ul.html(li);

                            //获取群员
                            othis.find('.layim-chat-members').html(res.members||(res.list||[]).length + '人');

                            //私聊
                            ul.find('li').on('click', function(){
                                var uid = $(this).data('uid'), info = membersCache[uid]
                                popchat({
                                    name: info.username
                                    ,type: 'friend'
                                    ,avatar: info.avatar
                                    ,id: info.id
                                });
                                hide();
                            });

                            layui.each(call.members, function(index, item){
                                item && item(res);
                            });
                        });
                        layero.on('mousedown', function(e){
                            stope(e);
                        });
                    }
                });
                $(document).off('mousedown', hide).on('mousedown', hide);
                $(window).off('resize', hide).on('resize', hide);
                othis.off('mousedown', stopmp).on('mousedown', stopmp);
            }
        }

        //发送聊天内容
        ,send: function(){
            sendMessage();
        }

        //设置发送聊天快捷键
        ,setSend: function(othis, e){
            var box = events.setSend.box = othis.siblings('.layim-menu-box')
                ,type = othis.attr('lay-type');

            if(type === 'show'){
                stope(e);
                box.show().addClass(anim);
                $(document).off('click', events.setSendHide).on('click', events.setSendHide);
            } else {
                othis.addClass(THIS).siblings().removeClass(THIS);
                var local = layui.data('layim')[cache.mine.id] || {};
                local.sendHotKey = type;
                layui.data('layim', {
                    key: cache.mine.id
                    ,value: local
                });
                events.setSendHide(e, othis.parent());
            }
        }, setSendHide: function(e, box){
            (box || events.setSend.box).hide().removeClass(anim);
        }

        //表情
        ,face: function(othis, e){
            var content = '', thatChat = thisChat();
            faces.forEach(function (item,index) {
                content += '<li title="'+ item +'">'+item+'</li>';
            })
            content = '<ul class="layui-clear layim-face-list">'+ content +'</ul>';

            events.face.index = layer.tips(content, othis, {
                tips: 1
                ,time: 0
                ,fixed: true
                ,skin: 'layui-box layui-layim-face'
                ,success: function(layero){
                    layero.find('.layim-face-list>li').on('mousedown', function(e){
                        stope(e);
                    }).on('click', function(){
                        var text = $(this).text()
                        focusInsert(thatChat.textarea[0],  text );
                        layer.close(events.face.index);
                    });
                }
            });

            $(document).off('mousedown', events.faceHide).on('mousedown', events.faceHide);
            $(window).off('resize', events.faceHide).on('resize', events.faceHide);
            stope(e);

        } ,faceHide: function(){
            layer.close(events.face.index);
        }

        //上传图片或文件
        ,imageSend: function(othis){
            var input = document.getElementById('sendFile');
            input.addEventListener('change',function(e) {
                var fileList = e.target.files;
                if (fileList.length > 0) {
                    let formData = new FormData();
                    formData.append('file', fileList[0]);
                    $.ajax({
                        url:"/api/user/upload",
                        type:"post",
                        data: formData,
                        contentType: false,
                        processData: false,
                        headers: { token: token },
                        success: function(res) {
                            if(res.code == 0){
                                sendMessage(res.data.file_url,res.data.file_name,res.data.file_ext);
                            } else {
                                layer.msg(res.msg||'上传失败');
                            }
                        },
                        error:function(data) {
                            alert("上传失败")
                        }
                    });
                }
            });
            $('#sendFile').replaceWith('<input id="sendFile" type="file" name="file"/>');
        }

        //音频和视频
        ,media: function(othis){
            var type = othis.data('type'), text = {
                audio: '音频'
                ,video: '视频'
            } ,thatChat = thisChat()

            layer.prompt({
                title: '请输入网络'+ text[type] + '地址'
                ,shade: false
                ,offset: [
                    othis.offset().top - $(window).scrollTop() - 158 + 'px'
                    ,othis.offset().left + 'px'
                ]
            }, function(src, index){
                focusInsert(thatChat.textarea[0], type + '['+ src +']');
                sendMessage();
                layer.close(index);
            });
        }

        //扩展工具栏
        ,extend: function(othis){
            var filter = othis.attr('lay-filter')
                ,thatChat = thisChat();

            layui.each(call['tool('+ filter +')'], function(index, item){
                item && item.call(othis, function(content){
                    focusInsert(thatChat.textarea[0], content);
                }, sendMessage, thatChat);
            });
        }

        //播放音频
        ,playAudio: function(othis){
            var audioData = othis.data('audio')
                ,audio = audioData || document.createElement('audio')
                ,pause = function(){
                audio.pause();
                othis.removeAttr('status');
                othis.find('i').html('&#xe652;');
            };
            if(othis.data('error')){
                return layer.msg('播放音频源异常');
            }
            if(!audio.play){
                return layer.msg('您的浏览器不支持audio');
            }
            if(othis.attr('status')){
                pause();
            } else {
                audioData || (audio.src = othis.data('src'));
                audio.play();
                othis.attr('status', 'pause');
                othis.data('audio', audio);
                othis.find('i').html('&#xe651;');
                //播放结束
                audio.onended = function(){
                    pause();
                };
                //播放异常
                audio.onerror = function(){
                    layer.msg('播放音频源异常');
                    othis.data('error', true);
                    pause();
                };
            }
        }

        //播放视频
        ,playVideo: function(othis){
            var videoData = othis.data('src')
                ,video = document.createElement('video');
            if(!video.play){
                return layer.msg('您的浏览器不支持video');
            }
            layer.close(events.playVideo.index);
            events.playVideo.index = layer.open({
                type: 1
                ,title: '播放视频'
                ,area: ['460px', '300px']
                ,maxmin: true
                ,shade: false
                ,content: '<div style="background-color: #000; height: 100%;"><video style="position: absolute; width: 100%; height: 100%;" src="'+ videoData +'" loop="loop" autoplay="autoplay"></video></div>'
            });
        }
        //查看大图
        ,imgShow: function(othis){
            var img = othis.html();
            layer.open({
                type: 1
                ,title: '图片'
                ,area: ['800px', '600px']
                ,maxmin: true
                ,shade: false
                ,content: '<div class="layer-img-box">'+img+'</div>'
            });
        }
        //播放语音
        ,playVoice:function (othis) {
            console.log(othis)
            var playImg = othis.children('palying');
            var stop = othis.children('stopping');
            var id = othis.children('audio').attr('id');
            var audio = document.getElementById(id);
            audio.currentTime = 0;
            audio.play();
            playImg.addClass('hide');
            stop.removeClass('hide');
            audio.addEventListener('ended', function () {
                playImg.removeClass('hide');
                stop.addClass('hide');
            }, false);

        }
        //聊天记录///////////////
        ,chatLog: function(othis){
            var thatChat = thisChat();
            if(!cache.base.chatLog){
                return layer.msg('未开启更多聊天记录');
            }
            layer.close(events.chatLog.index);
            layer.open({
                type: 1
                ,maxmin: true
                ,title: '与 '+ thatChat.data.name +' 的聊天记录'
                ,area: ['450px', '100%']
                ,shade: false
                ,offset: 'rb'
                ,skin: 'layui-box'
                ,anim: 2
                ,id: 'layui-layim-chatlog'
                ,content:'<div class="layim-chat-main chat-log-more"><ul></ul></div>'
            });
            logPage = 1;
            getMoreLog(logPage);
        }
        //请求获取聊天记录
        //历史会话右键菜单操作
        ,menuHistory: function(othis, e){
            var local = layui.data('layim')[cache.mine.id] || {};
            var parent = othis.parent(), type = othis.data('type');
            var hisElem = layimMain.find('.layim-list-history');
            var none = '<li class="layim-null">暂无历史会话</li>'

            if(type === 'one'){
                var history = local.history;
                delete history[parent.data('index')];
                local.history = history;
                layui.data('layim', {
                    key: cache.mine.id
                    ,value: local
                });
                $('#'+parent.data('id')).remove();
                if(hisElem.find('li').length === 0){
                    hisElem.html(none);
                }
            } else if(type === 'all') {
                delete local.history;
                layui.data('layim', {
                    key: cache.mine.id
                    ,value: local
                });
                hisElem.html(none);
            }

            layer.closeAll('tips');
        }

    };

    //暴露接口
    exports('layim', new LAYIM());

}).addcss(
    'modules/layim/layim.css?v=3.60Pro'
    ,'skinlayimcss'
);
