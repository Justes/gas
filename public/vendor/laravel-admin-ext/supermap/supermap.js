	var map, stationMarkers = [], companyMarkers = [];
	var host           = 'https://iserver.supermap.io';
    var url            = host + '/iserver/services/map-china400/rest/maps/China_4326';
    var addressUrl     = host + '/iserver/services/addressmatch-Address/restjsr/v1/address';
    
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
    
    stations.forEach(function(item) {
    	stationMarkers.push(L.marker([item.lat, item.lng]).bindPopup(item.station_name))
	});
    companies.forEach(function(item) {
    	companyMarkers.push(L.marker([item.lat, item.lng]).bindPopup(item.company_name))
	});
    L.layerGroup(stationMarkers).addTo(map);
	L.layerGroup(companyMarkers).addTo(map);
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
    $("#all-point, #station, #company").on('click',function(){
    	console.log(map.layers);
    	clearMarkers();
    	/*map.removeLayer();*/
    });
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