<script type="text/javascript">
var stations 	= JSON.parse('<?php echo $stations ?>');
var companies 	= JSON.parse('<?php echo $companies ?>');
var lat = "";
var lng = "";
</script>
<style type="text/css">
<!--
#topFrame {
    position: absolute;
    top: 0px;
    bottom: 0px;
    width: 100%;
	height: 100%;
}
#cover{
    filter: alpha(opacity=50); /* IE的透明度 */
    opacity: 0.8;  /* 透明度 */
    position: absolute;
	top: 0px;
    bottom: 0px;
    width: 100%;
    z-index: 100; /* 此处的图层要大于页面 */
	background: #ffffff url('/vendor/laravel-admin-ext/supermap/local/cdn/images/load.gif') no-repeat scroll 48% center;
	height: 100%;
}
-->
</style>
<div id="cover"></div>
<iframe src="" name="topFrame" scrolling="No" noresize="noresize" frameborder="0" id="topFrame"></iframe>

<script type="text/javascript">
$(function(){
	$('#topFrame').attr("src", "/html/supermap/index.html");
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