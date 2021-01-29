function inputScript(url,callback, scriptid = ""){
    var script=document.createElement('script');
    script.type="text/javascript";
    if(typeof(callback)!="undefined"){
        if(script.readyState){
            script.onreadystatechange=function(){
                if(script.readyState == "loaded" || script.readyState == "complete"){
                    script.onreadystatechange=null;
                    callback();
                }
            }
        }else{
            script.onload=function(){
                callback();
            }
        }
    }
    script.src=url;
    if(scriptid != ""){
    	script.id = scriptid;	
    }
    document.body.appendChild(script);
}
function inputCSS(url) {
    var link=document.createElement('link');
    link.rel="stylesheet";
    link.href=url;
    document.head.appendChild(link);
}

/*$(function(){
	inputScript("/vendor/laravel-admin-ext/supermap/dist/leaflet/include-leaflet.js",function(){
		console.log(1);
		inputScript("/vendor/laravel-admin-ext/supermap/examples/js/include-web.js",function(){
			console.log(2);
	    });
    });
});
window.onload=function(){
	inputScript("/vendor/laravel-admin-ext/supermap/supermap.js",function(){
		console.log(3);
    });
}*/