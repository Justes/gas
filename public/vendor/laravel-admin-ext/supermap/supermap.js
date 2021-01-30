	var map, stationMarkers = [], companyMarkers = [];
	var host           = 'https://iserver.supermap.io';
    var url            = host + '/iserver/services/map-china400/rest/maps/China_4326';
    var addressUrl     = host + '/iserver/services/addressmatch-Address/restjsr/v1/address';
    var companyIcon = '/vendor/laravel-admin-ext/supermap/local/cdn/images/company_icon.png';
    var stationIcon = '/vendor/laravel-admin-ext/supermap/local/cdn/images/company_icon.png';
    
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
    stationInit();
    companyInit();
	
    $("#all-point").on('click',function(){
    	pointActive($(this));
    	clearMarkers();
    	stationInit();
        companyInit();
    });
    $("#company").on('click',function(){
    	pointActive($(this));
    	clearMarkers();
    	companyInit();
    	
    });
    $("#station").on('click',function(){
    	pointActive($(this));
    	clearMarkers();
    	stationInit();
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
    stationMarkers = [];
    companyMarkers = [];
}

function stationInit()
{
	var stationIcon = '/vendor/laravel-admin-ext/supermap/local/cdn/images/map-marker-alt-solid.png';
	var stationShadowIcon = '/vendor/laravel-admin-ext/supermap/local/cdn/images/marker-shadow.png';
	var greenIcon = L.icon({
	    iconUrl: stationIcon,
	    shadowUrl: stationShadowIcon,

	    iconSize:     [32, 32],    //  图标的大小    【值1，值2】 为具体你自定义图标的尺寸，比如我图标尺寸是32×52，表示该图标：宽度32像素，高度：52像素，那么值1:就是32，值2：就是52
	    shadowSize:   [41, 30], //  影子的大小    【值1，值2】 为具体你自定义阴影图标的尺寸，比如我图标尺寸是41×41，表示该图标：宽度41像素，高度：41像素，那么值1:就是41，值2：就是41
	    iconAnchor:   [16, 32],  //  图标将对应标记点的位置 这个是重点， 【值1，值2】，值1：为图标坐标第一个值(即32)的一半，值2：为图标坐标第二个值(即52)
	    shadowAnchor: [12, 32],  // 相同的影子
	    popupAnchor:  [0, -30] // 该点是相对于iconAnchor弹出信息的位置  这个是我手动调出来的，文档默认原始值是[-1，-76]，我是去一半值，取一半值调出来的
	});

	stations.forEach(function(item) {
		var info = "<b>"+item.station_name+"</b>   <a href='JavaScript:void(0)' class='station_detail detail' data-id='"+item.id+"'>场站详情></a><br>";
		info += "所属公司："+item.company_name+"<br>";
		info += "站点地址："+item.addr+"<br>";
		info += "管理员："+item.contact_user+"<br>";
		info += "联系电话："+item.contact_user_mobile+"<br>";
		info += "供气区域："+item.zones+"";
    	stationMarkers.push(L.marker([item.lat, item.lng], {icon: greenIcon}).bindPopup(info))
	});
	L.layerGroup(stationMarkers).addTo(map);
}
function companyInit()
{
	
	var stationIcon = '/vendor/laravel-admin-ext/supermap/local/cdn/images/map-marker-shield.png';
	var stationShadowIcon = '/vendor/laravel-admin-ext/supermap/local/cdn/images/marker-shadow.png';
	var greenIcon = L.icon({
	    iconUrl: stationIcon,
	    shadowUrl: stationShadowIcon,

	    iconSize:     [32, 32],    //  图标的大小    【值1，值2】 为具体你自定义图标的尺寸，比如我图标尺寸是32×52，表示该图标：宽度32像素，高度：52像素，那么值1:就是32，值2：就是52
	    shadowSize:   [41, 32], //  影子的大小    【值1，值2】 为具体你自定义阴影图标的尺寸，比如我图标尺寸是41×41，表示该图标：宽度41像素，高度：41像素，那么值1:就是41，值2：就是41
	    iconAnchor:   [16, 32],  //  图标将对应标记点的位置 这个是重点， 【值1，值2】，值1：为图标坐标第一个值(即32)的一半，值2：为图标坐标第二个值(即52)
	    shadowAnchor: [12, 32],  // 相同的影子
	    popupAnchor:  [0, -30] // 该点是相对于iconAnchor弹出信息的位置  这个是我手动调出来的，文档默认原始值是[-1，-76]，我是去一半值，取一半值调出来的
	});
	
	companies.forEach(function(item) {
		var info = "<b>"+item.company_name+"</b>  <a href='JavaScript:void(0)' class='company_detail detail' data-id='"+item.id+"'>企业详情></a><br>";
		info += "企业地址："+item.addr+"";
		companyMarkers.push(L.marker([item.lat, item.lng], {icon: greenIcon}).bindPopup(info))
	});
	L.layerGroup(companyMarkers).addTo(map);
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