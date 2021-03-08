<script type="text/javascript">
var stations 	= [];
var companies 	= [];
</script>
<style type="text/css">
<!--
#topFrame {
    width: 100%;
	height: {{ $height }}px;
}
#cover{
    filter: alpha(opacity=50); /* IE的透明度 */
    opacity: 0.8;  /* 透明度 */
    position: absolute;
    left: 0px;
    width: 100%;
    z-index: 100; /* 此处的图层要大于页面 */
	background: #ffffff url('/vendor/laravel-admin-ext/supermap/local/cdn/images/load.gif') no-repeat scroll 48% center;
	height: {{ $height }}px;
}
-->
</style>

<div class="{{$viewClass['form-group']}} {!! !$errors->has($errorKey) ? '' : 'has-error' !!}">

    <label for="{{$id['lat']}}" class="{{$viewClass['label']}} control-label">{{$label}}</label>

    <div class="{{$viewClass['field']}}">

        @include('admin::form.error')

        <div class="row">
            <div class="col-md-3">
                <input id="{{$id['lng']}}" name="{{$name['lng']}}" class="form-control" value="{{ old($column['lng'], $value['lng'] ?? null) }}" {!! $attributes !!} />
            </div>
            <div class="col-md-3">
                <input id="{{$id['lat']}}" name="{{$name['lat']}}" class="form-control" value="{{ old($column['lat'], $value['lat'] ?? null) }}" {!! $attributes !!} />
            </div>

            @if($provider != 'yandex')
            <div class="col-md-3 col-md-offset-3">
                <div class="input-group">
                    <input type="text" class="form-control" id="search-{{$id['lat'].$id['lng']}}">
                    <span class="input-group-btn">
                        <button type="button" class="btn btn-info btn-flat"><i class="fa fa-search"></i></button>
                    </span>
                </div>
            </div>
            @endif
        </div>
        @include('admin::form.help-block')
    </div>
    <div id="cover"></div>
    <iframe src="" name="topFrame" scrolling="No" noresize="noresize" frameborder="0" id="topFrame"></iframe>
</div>

<script type="text/javascript">
var height = {{ $height }}
$(function(){
	$('#topFrame').attr("src", "/html/supermap/form.html");
	var iframe = document.getElementById("topFrame");
	if(iframe.attachEvent){
		iframe.attachEvent("onreadystatechange", function() {
			//此事件在内容没有被载入时候也会被触发，所以我们要判断状态
			//有时候会比较怪异 readyState状态会跳过 complete 所以我们loaded状态也要判断
			if (iframe.readyState === "complete" || iframe.readyState == "loaded") {
	    		//代码能执行到这里说明已经载入成功完毕了
				$("#cover").hide();
	    		//要清除掉事件
	    		iframe.detachEvent("onreadystatechange", arguments.callee);
	    		//这里是回调函数
			}
		});
	}else{
		iframe.addEventListener("load", function() {
			$("#cover").hide();
			//代码能执行到这里说明已经载入成功完毕了
			this.removeEventListener("load", arguments.call, false);
			//这里是回调函数
		}, false);
	}
});

</script>
