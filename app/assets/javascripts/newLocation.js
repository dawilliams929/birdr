// function initialize() {
//   var mapOptions = {
//     zoom: 10,
//     center: new google.maps.LatLng(37.65, -122.05)
//   };
// 
//   var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
// 	var marker = new google.maps.Marker({
// 		map: map,
// 		draggable: true
// 	});
// 			
//   google.maps.event.addListener(map, 'click', function(mouseEvent) {
// 		marker.setPosition(mouseEvent.latLng);
// 		
// 		function populateLatLongFields (marker) {
// 			var position = marker.getPosition();
// 			var lat = position.lat();
// 			var lng = position.lng();
// 			document.getElementById('location_latitude').value = lat;
// 			document.getElementById('location_longitude').value = lng;
// 		}
// 		
// 		function populateNameField (marker) {
// 			var name = $('.name_field').val();
// 			document.getElementById('location_name').value = name;
// 		}
// 		
// 		google.maps.event.addListener(marker, 'dragend', function() {
// 			populateLatLongFields(marker);
// 		});
// 		
// 		google.maps.event.addListener(marker, 'click', function() {
// 			infowindow.open(map,marker);
// 	  });	
// 		
// 		populateLatLongFields(marker);
// 		populateNameField(marker);
//   });
// 	
// 	var contentString = '<p>Location name</p> + <textarea class="name_field">';
// 
//   var infowindow = new google.maps.InfoWindow({
//   	content: contentString
//   });
// }
// 
// google.maps.event.addDomListener(window, 'load', initialize);