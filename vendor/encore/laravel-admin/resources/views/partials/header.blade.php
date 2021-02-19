<!-- Main Header -->
<style>
    .tab-wrapper{
       padding:5px 0;
       height: calc(100vh - 108px);
       overflow: auto;
    }
    .group-wrapper li, .friend-wrapper li{
        display: flex;
        align-items: center;
        padding: 5px 10px;
        color: #333333;
        font-size: 15px;
        cursor: pointer;
    }
    .group-wrapper li img, .friend-wrapper li img{
        width: 44px;
        height: 44px;
        border-radius: 4px;
        margin-right: 10px;
    }
    .friend-wrapper .f-item .letter{
        background-color: #f1f1f1;
        padding: 3px 15px;
        color: #333333;
    }

    .chatList .msg-item{
        display: flex;
        align-items: center;
        padding: 7px 10px;
    }
    .chatList .msg-item .img-box{
        margin-right: 10px;
        position: relative;
    }
    .chatList .msg-item .img-box span{
        font-size: 12px;
        position: absolute;
        right: -7px;
        top: -8px;
        min-width: 15px;
        text-align: center;
        display: block;
        padding: 1px;
        color: #fff;
        background-color: #f30;
        border-radius: 100% 100%;
    }
    .chatList .msg-item .img-box span.hide{
        display:none;
    }
    .chatList .msg-item img{
        width: 44px;
        height: 44px;
        border-radius: 4px;
    }
    .chatList .msg-item h4{
        color:#333333;
        font-size:15px;
        margin-bottom:5px;
     }
    .chatList .msg-item p{
         color:#999;
         font-size:12px;
         width:250px;
         overflow: hidden;
         text-overflow:ellipsis;
         white-space: nowrap;
      }
    .msg-box img{
       max-width:160px;
    }
     .msg-box .file-msg{
         padding: 5px 10px;
         display: flex;
         align-items: center;
         color: #333333;
         background-color:#fff
     }
     .msg-box .file-msg img{
         width: 32px;
         height: 32px;
         margin-right:3px;
     }
     .msg-box .file-msg p{
         color: #333333;
     }
     .layim-chat-list li .tips{
         font-size: 12px;
         position: absolute;
         left: 36px;
         top: 0;
         min-width: 15px;
         text-align: center;
         display: block;
         padding: 1px;
         color: #fff;
         background-color: #f30;
         border-radius: 100% 100%;
         width: unset;
         line-height: 1;
     }
     .layim-chat-list li img, .layui-layim-min .layui-layer-content img{
         border-radius:4px;
     }
     .layim-chat-other img{
         border-radius:4px;
     }
     .layim-chat-list li .tips-0{
         display:none;
     }
     .chat-log-more{
        height: calc(100% - 21px)
     }
     .layim-chat-user img{
        border-radius:4px;
     }
     .layui-layim-face ul li{
        font-size: 18px;
     }
     .layer-img-box{
        text-align: center;
     }
      .voice-box img{
          width: 18px;
          transform: rotate(180deg)
      }
      .layim-chat-mine .voice-box img{
          transform: unset;
      }
      .voice-box hide{
         display:none;
      }
       .voice-box show{
         display:block;
       }
     .voice-box  audio{
          position: absolute;
          opacity: 0;
          width: 200px;
          height: 30px;
          z-index: -1;
      }
</style>
<header class="main-header">

    <!-- Logo -->
    <a href="{{ admin_url('/') }}" class="logo">
        <!-- mini logo for sidebar mini 50x50 pixels -->
        <span class="logo-mini">{!! config('admin.logo-mini', config('admin.name')) !!}</span>
        <!-- logo for regular state and mobile devices -->
        <span class="logo-lg">{!! config('admin.logo', config('admin.name')) !!}</span>
    </a>

    <!-- Header Navbar -->
    <nav class="navbar navbar-static-top" role="navigation">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle hide" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
        </a>
        <ul class="nav navbar-nav hidden-sm visible-lg-block">
        {!! Admin::getNavbar()->render('left') !!}
        </ul>

        <!-- Navbar Right Menu -->
        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">

<!--
                {!! Admin::getNavbar()->render() !!}
-->
				<li>
					<a href="/admin/notices">
						<i class="fa fa-bell"></i>
					</a>
				</li>

				<li>
					<a href="javascript:void(0);" id="chat-aside-toggle">
						<i class="fa fa-comments"></i>
					</a>
				</li>

                <!-- User Account Menu -->
                <li class="dropdown user user-menu">
                    <!-- Menu Toggle Button -->
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <!-- The user image in the navbar-->
                        <img src="{{ Admin::user()->avatar }}" class="user-image" alt="User Image">
                        <!-- hidden-xs hides the username on small devices so only the image appears. -->
                        <span class="hidden-xs">{{ Admin::user()->name }}</span>
                    </a>
                    <ul class="dropdown-menu">
                        <!-- The user image in the menu -->
                        <li class="user-header">
                            <img src="{{ Admin::user()->avatar }}" class="img-circle" alt="User Image">

                            <p>
                                {{ Admin::user()->name }}
<!--
                                <small>Member since admin {{ Admin::user()->created_at }}</small>
-->
                            </p>
                        </li>
                        <li class="user-footer">
                            <div class="pull-left">
                                <a href="{{ admin_url('auth/setting') }}" class="btn btn-default btn-flat">{{ trans('admin.setting') }}</a>
                            </div>
                            <div class="pull-right">
                                <a href="{{ admin_url('auth/logout') }}" class="btn btn-default btn-flat">{{ trans('admin.logout') }}</a>
                            </div>
                        </li>
                    </ul>
                </li>
                <!-- Control Sidebar Toggle Button -->
                {{--<li>--}}
                    {{--<a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>--}}
                {{--</li>--}}
            </ul>
        </div>
    </nav>
</header>


<aside id="aside-container">
	<ul class="nav nav-tabs nav-justified chatbar">
        <li class="active">
            <a href="#demo-asd-tab-1" data-toggle="tab">
                <i class="fa fa-user"></i> 消息
            </a>
        </li>
        <li>
            <a href="#demo-asd-tab-2" data-toggle="tab">
                <i class="fa fa-users"></i> 联系人
            </a>
        </li>
        <!--<li>
            <a href="#demo-asd-tab-3" data-toggle="tab">
                <i class="fa fa-commenting"></i> 消息记录
            </a>
        </li> -->
    </ul>
    <div class="tab-content">
        <div class="tab-pane fade in active" id="demo-asd-tab-1">
        <div class="tab-wrapper">
                        <ul class="chatList">
                           </ul>
               </div>

        </div>
        <div class="tab-pane fade" id="demo-asd-tab-2">
        <div class="tab-wrapper">
            <div class="group-wrapper">
                 <ul class="chatGroupList">
                  </ul>
            </div>
        	<div class="friend-wrapper">
            </div>
            </div>
        </div>
        <div class="tab-pane fade" id="demo-asd-tab-3">
            <ul class="chatListLog layui-layim-list">
            </ul>
		</div>

    </div>
</aside>

