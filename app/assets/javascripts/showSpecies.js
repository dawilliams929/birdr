function initialize() {
	var mapOptions = {
		center: new google.maps.LatLng(38, -122),
  	zoom: 9,
    mapTypeId: google.maps.MapTypeId.SATELLITE
	};
  var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
	var bounds = new google.maps.LatLngBounds();
	
  setMarkers(map, bounds, function (markers) {
		if (markers.length > 0) {
			map.fitBounds(bounds);
		}
  });
	
	zoomOutIfTooClose(map);
}

function createMarker(location, map) {
	var lat = location.lat;
	var lng = location.long;
	var latLng = new google.maps.LatLng(lat, lng);
	
	return new google.maps.Marker({
		position: latLng,
		map: map
	});
}

function setMarkers(map, bounds, callback) {
	var infoWindow = new google.maps.InfoWindow();
	var jsonUrl = "/species/" + id + ".json";
	var markers = [];
	
	$.getJSON(jsonUrl, function (locations) {
		$.each(locations, function (index, location) {
			var marker = createMarker(location, map);
			markers.push(marker);
			
			bounds.extend(marker.position);
			
			google.maps.event.addListener(marker, 'click', function () {
				var rowDataString = "";
				$.each(location.data, function (index, entry) {
					rowDataString += "<tr><td>" + entry.date + "</td><td>" + entry.count + "</td><td>" + entry.user + "</td><td><a href='/observations/" + entry.observation_id + "'>checklist</a></td></tr>";
				});
				var contentString = "<h5>" + location.name + "</h5><table class='table  table-condensed table-striped'><thead><tr><th>Date</th><th>#</th><th>Observer</th></tr></thead><tbody>" + rowDataString + "</tbody></table>";
				infoWindow.setContent(contentString);
				infoWindow.open(map, marker);
			});
		});
		
		callback(markers);
	});
}

function zoomOutIfTooClose(map) {
	google.maps.event.addListenerOnce(map, 'zoom_changed', function () {
		if (map.getZoom() > 9) {
			map.setZoom(9);
		}
	});
}

google.maps.event.addDomListener(window, 'load', initialize);