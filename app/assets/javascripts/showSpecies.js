function initialize() {
	var mapOptions = {
  	zoom: 9,
    center: new google.maps.LatLng(37.6, -122),
    mapTypeId: google.maps.MapTypeId.SATELLITE
	};
  var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
  setMarkers(map);
}

function setMarkers(map) {
	var infoWindow = new google.maps.InfoWindow();
	var jsonUrl = "/species/" + id + ".json";
	
	$.getJSON(jsonUrl, function (locations) {
		$.each(locations, function (index, location) {
			var lat = location.lat;
			var lng = location.long;
			var latLng = new google.maps.LatLng(lat, lng);
			
			var marker = new google.maps.Marker({
				position: latLng,
				map: map
			});
			
			google.maps.event.addListener(marker, 'click', function () {
				var rowDataString = "";
				$.each(location.data, function (index, entry) {
					rowDataString += "<tr><td>" + entry.date + "</td><td>" + entry.count + "</td><td>" + entry.user + "</td><td><a href='/observations/" + entry.observation_id + "'>checklist</a></td></tr>";
				});
				var contentString = "<h3>" + location.name + "</h3><table><tr><th>DATE</th><th>#</th><th>OBSERVER</th></tr>" + rowDataString + "</table>";
				infoWindow.setContent(contentString);
				infoWindow.open(map, marker);
			});
		});
	});
}

google.maps.event.addDomListener(window, 'load', initialize);