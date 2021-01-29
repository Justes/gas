	var map, codeMarkers = [], decodeMarkers = [];
	var host           = 'https://iserver.supermap.io';
    var url            = host + '/iserver/services/map-china400/rest/maps/China_4326';
    var addressUrl     = host + '/iserver/services/addressmatch-Address/restjsr/v1/address';
    var lat
    var lng
    var flag = false;
    if( ! lat || ! lng) {
        lat = "39.914714";
        lng = "116.383572"; 
    }else{
        flag = true;
    }

    map = L.map('map_latlng', {
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
    map.on('click',function(e){
    	var geoDecodeParam = new SuperMap.GeoDecodingParameter({
            x: e.latlng.lng,
            y: e.latlng.lat,
            fromIndex: 0,
            toIndex: 10,
            filters: "",
            prjCoordSys: "{epsgcode:4326}",
            maxReturn:-1,
            geoDecodingRadius: -1,
        });
        addressMatchService.decode(geoDecodeParam, match);
    })
    $(".input-group-btn").on('click',function(){
        address = $('#search-latlng').val();
        if(!isNull(address)){
            var geoCodeParam = new SuperMap.GeoCodingParameter({
                address:    $('#search-latlng').val(),
                fromIndex:  0,
                toIndex:    10,
                filters:    "",
                prjCoordSys:"{epsgcode:4326}",
                maxReturn:  -1
            });
            addressMatchService.code(geoCodeParam, match);
        }
    });
    function match(obj) {
        clearMarkers();
        obj.result.map(function (item) {
            var marker = L.marker([item.location.y, item.location.x]);
            decodeMarkers.push(marker);
            var innerHTML = "";
            innerHTML += "地址 : " + item.address + "<br>";
            var x = Number(item.location.x.toString().match(/^\d+(?:\.\d{0,2})?/));
            var y = Number(item.location.y.toString().match(/^\d+(?:\.\d{0,2})?/));
            innerHTML += resources.text_coordinate + ":[" + x + "," + y + "]<br>";
            //if (item.score > 0) {
            //    innerHTML += resources.text_matchDegree + ":" + item.score + "<br>";
            //}
            //innerHTML += resources.text_filterField + ":" + item.filters + "<br>";
            marker.on('click',function(e){
            	setLatLng(e.latlng.lat, e.latlng.lng)
                $("#addr").val(item.address)
            })
            marker.bindPopup(innerHTML);
        });
        for (var i = 0; i < decodeMarkers.length; i++) {
            decodeMarkers[i].addTo(map);
        }
        map.setView(L.latLng(39.914714, 116.383572), 10);
    }
    function clearMarkers() {
        if (codeMarkers) {
            for (var i = 0; i < codeMarkers.length; i++) {
                codeMarkers[i].remove();
            }
        }
        if (decodeMarkers) {
            for (var i = 0; i < decodeMarkers.length; i++) {
                decodeMarkers[i].remove();
            }
        }
        codeMarkers = [];
        decodeMarkers = [];
    }

    function handleMapEvent(div, map) {
        if (!div || !map) {
            return;
        }
        div.addEventListener('mouseover', function () {
            map.dragging.disable();
            map.scrollWheelZoom.disable();
            map.doubleClickZoom.disable();
        });
        div.addEventListener('mouseout', function () {
            map.dragging.enable();
            map.scrollWheelZoom.enable();
            map.doubleClickZoom.enable();
        });
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
