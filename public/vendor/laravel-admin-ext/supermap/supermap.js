	var stations 	= parent.stations;
  	var companies  	= parent.companies;	
  	var map, stationMarkers = [], companyMarkers = [], stationCircleMarkers = [], companyCircleMarkers = [];
	var host           = 'https://iserver.supermap.io';
    var url            = host + '/iserver/services/map-china400/rest/maps/China_4326';
    var addressUrl     = host + '/iserver/services/addressmatch-Address/restjsr/v1/address';
    
    var stationIconImage = '/vendor/laravel-admin-ext/supermap/local/cdn/images/map-marker-alt-solid.png';
	var stationShadowIcon = '/vendor/laravel-admin-ext/supermap/local/cdn/images/marker-shadow.png';
	var stationIcon = L.icon({
	    iconUrl: stationIconImage,
	    shadowUrl: stationShadowIcon,

	    iconSize:     [32, 32],    //  图标的大小    【值1，值2】 为具体你自定义图标的尺寸，比如我图标尺寸是32×52，表示该图标：宽度32像素，高度：52像素，那么值1:就是32，值2：就是52
	    shadowSize:   [41, 30], //  影子的大小    【值1，值2】 为具体你自定义阴影图标的尺寸，比如我图标尺寸是41×41，表示该图标：宽度41像素，高度：41像素，那么值1:就是41，值2：就是41
	    iconAnchor:   [16, 32],  //  图标将对应标记点的位置 这个是重点， 【值1，值2】，值1：为图标坐标第一个值(即32)的一半，值2：为图标坐标第二个值(即52)
	    shadowAnchor: [12, 32],  // 相同的影子
	    popupAnchor:  [0, -30] // 该点是相对于iconAnchor弹出信息的位置  这个是我手动调出来的，文档默认原始值是[-1，-76]，我是去一半值，取一半值调出来的
	});
	
	var companyIconImage = '/vendor/laravel-admin-ext/supermap/local/cdn/images/map-marker-shield.png';
	var companyShadowIcon = '/vendor/laravel-admin-ext/supermap/local/cdn/images/marker-shadow.png';
	var companyIcon = L.icon({
	    iconUrl: companyIconImage,
	    shadowUrl: companyShadowIcon,

	    iconSize:     [32, 32],    //  图标的大小    【值1，值2】 为具体你自定义图标的尺寸，比如我图标尺寸是32×52，表示该图标：宽度32像素，高度：52像素，那么值1:就是32，值2：就是52
	    shadowSize:   [41, 32], //  影子的大小    【值1，值2】 为具体你自定义阴影图标的尺寸，比如我图标尺寸是41×41，表示该图标：宽度41像素，高度：41像素，那么值1:就是41，值2：就是41
	    iconAnchor:   [16, 32],  //  图标将对应标记点的位置 这个是重点， 【值1，值2】，值1：为图标坐标第一个值(即32)的一半，值2：为图标坐标第二个值(即52)
	    shadowAnchor: [12, 32],  // 相同的影子
	    popupAnchor:  [0, -30] // 该点是相对于iconAnchor弹出信息的位置  这个是我手动调出来的，文档默认原始值是[-1，-76]，我是去一半值，取一半值调出来的
	});
	
	var circleOption =  {
        stroke: true,
        color: '#aaaaaa',
        weight: 0,
        opacity: 1,
        fillColor: '#5e5858',
        radius: circleRadius,
    };
	
    
    var flag = false;
    if( ! lat || ! lng) {
        lat = "39.914714";
        lng = "116.383572"; 
    }else{
        flag = true;
    }

    map = L.map('map', {
        crs: L.CRS.EPSG4326,
        center: [lat, lng],
        maxZoom: 18,
        zoom: 11
    });
    L.supermap.tiledMapLayer(url).addTo(map);
    addressMatchService = L.supermap.addressMatchService(addressUrl);
    if(flag) {
        L.marker([lat, lng]).addTo(map);
    }
    stationInit(stations);
    companyInit(companies);
	$("#search").on('click',function(){
		var keyword = $("#search-text").val().trim();
		var type = $(".select-type").val();
		if(keyword != "" && type != ""){
			clearMarkers();
			$('#search_result').addClass(type);
			if(type == "station"){
				$("#search_result .result_name").html("匹配场站");
			}else{
				$("#search_result .result_name").html("匹配企业");
			}
	    	$.get("/admin/home/search", {type: type, keyword: keyword},function(result){
	    		result = JSON.parse(result);
	    		console.log(result.code);
	    		if(!result.code){
	    			$("#search_result .result_count").html(result.data.count);
	    			if(result.data.count > 0){
	    				if(type == "station"){
	    					stationInit(result.data.list);
	    				}else{
	    					companyInit(result.data.list);
	    				}
	    			}else{
	    				$("#search_result .result_count").html("0");
	    			}
	    			pointActive($("#search_result"));
	    		}
			});	
		}
    });
    $("#all-point").on('click',function(){
    	pointActive($(this));
    	clearMarkers();
    	stationInit(stations);
        companyInit(companies);
    });
    $("#company").on('click',function(){
    	pointActive($(this));
    	clearMarkers();
    	companyInit(companies);
    	
    });
    $("#station").on('click',function(){
    	pointActive($(this));
    	clearMarkers();
    	stationInit(stations);
    });
    $("div").delegate(".station_detail","click",function(){
    	var data_id = $(this).attr("data-id");
    	var url = "/admin/stations/"+data_id;
    	parent.location.href=url;
    });
    $("div").delegate(".company_detail","click",function(){
    	var data_id = $(this).attr("data-id");
    	var url = "/admin/companies/"+data_id;
    	parent.location.href=url;
    });
function pointActive(obj)
{
	obj.parent("ul").find("li.active").removeClass("active");
	obj.addClass("active");
	if(obj.attr("id") != "search_result"){
		$("#search_result").hide();
		$("#search-text").val("");
	}else{
		$("#search_result").show();
	}
}
    
function clearMarkers() {
    if (stationMarkers) {
        for (var i = 0; i < stationMarkers.length; i++) {
        	stationMarkers[i].remove();
        }
    }
    if (companyMarkers) {
        for (var i = 0; i < companyMarkers.length; i++) {
        	companyMarkers[i].remove();
        }
    }
    if (stationCircleMarkers) {
        for (var i = 0; i < stationCircleMarkers.length; i++) {
        	stationCircleMarkers[i].remove();
        }
    }
    if (companyCircleMarkers) {
        for (var i = 0; i < companyCircleMarkers.length; i++) {
        	companyCircleMarkers[i].remove();
        }
    }
    stationMarkers = [];
    companyMarkers = [];
    stationCircleMarkers = [];
    /*companyCircleMarkers = [];*/
}

function stationInit(list)
{
	list.forEach(function(item) {
		var info = "<b>"+item.station_name+"</b>   <a href='JavaScript:void(0)' class='station_detail detail' data-id='"+item.id+"'>场站详情></a><br>";
		info += "所属公司："+item.company_name+"<br>";
		info += "站点地址："+item.addr+"<br>";
		info += "&nbsp&nbsp&nbsp&nbsp管理员："+item.contact_user+"<br>";
		info += "联系电话："+item.contact_user_mobile+"<br>";
		info += "供气区域："+item.zones+"";
    	stationMarkers.push(L.marker([item.lat, item.lng], {icon: stationIcon}).bindPopup(info));
    	stationCircleMarkers.push(L.circleMarker([item.lat, item.lng], circleOption));
	});
	L.layerGroup(stationMarkers).addTo(map);
	L.layerGroup(stationCircleMarkers).addTo(map);
}
function companyInit(list)
{
	list.forEach(function(item) {
		var info = "<b>"+item.company_name+"</b>  <a href='JavaScript:void(0)' class='company_detail detail' data-id='"+item.id+"'>企业详情></a><br>";
		info += "企业地址："+item.addr+"";
		companyMarkers.push(L.marker([item.lat, item.lng], {icon: companyIcon}).bindPopup(info));
		companyCircleMarkers.push(L.circleMarker([item.lat, item.lng], circleOption));
	});
	L.layerGroup(companyMarkers).addTo(map);
	L.layerGroup(companyCircleMarkers).addTo(map);
}
    
//判断输入字符串是否为空或者全部都是空格
function isNull(str) {
    if (str == "") return true;
    var regu = "^[ ]+$";
    var re = new RegExp(regu);
    return re.test(str);
}
function setLatLng(lat, lng)
{
    $("#lat").val(convert(lat))	
    $("#lng").val(convert(lng))	
}
function convert(data){
    data = data + "";
    var re = /([0-9]+.[0-9]{2})[0-9]*/;
    return data.replace(re,"$1");
}