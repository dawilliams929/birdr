function initialize() {
  var mapOptions = {
    zoom: 10,
    center: new google.maps.LatLng(37.65, -122.05)
  };
  var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
	var marker = new google.maps.Marker({
		map: map,
		draggable: true
	});
			
  google.maps.event.addListener(map, 'click', function (mouseEvent) {
		marker.setPosition(mouseEvent.latLng);
		
		google.maps.event.addListener(marker, 'dragend', function() {
			populateLatLongFields(marker);
		});

		populateLatLongFields(marker);
  });
}

function populateLatLongFields(marker) {
	var position = marker.getPosition();
	var lat = position.lat();
	var lng = position.lng();
	document.getElementById('location_latitude').value = lat;
	document.getElementById('location_longitude').value = lng;
}

google.maps.event.addDomListener(window, 'load', initialize);