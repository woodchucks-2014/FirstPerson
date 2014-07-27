var mapStyle = [
  {
    "featureType": "road",
    "stylers": [
      { "visibility": "off" }
    ]
  },{
    "featureType": "landscape.man_made",
    "stylers": [
      { "visibility": "on" },
      { "color": "#b8de91" }
    ]
  },{
    "featureType": "landscape.natural",
    "stylers": [
      { "color": "#b8de91" }
    ]
  },{
    "featureType": "poi",
    "stylers": [
      { "visibility": "off" }
    ]
  },{
    "featureType": "administrative",
    "stylers": [
      { "visibility": "off" }
    ]
  },{
    "featureType": "water",
    "elementType": "labels.text",
    "stylers": [
      { "color": "#8080d6" },
      { "hue": "#1900ff" },
      { "visibility": "off" }
    ]
  },{
    "featureType": "water",
    "stylers": [
      { "color": "#6b80e1" }
    ]
  },{
  }
]

// var get_points = function(handler) {
//   $.getJSON("/checkins", function(data){
//     markers = handler.addMarkers(data);
//   });
// }

var points = {};
$(document).ready(function(){
  $.ajaxSetup({
    async: false
  });


  $.getJSON("/checkins", function(data){
    points = data;
  });

  handler = Gmaps.build('Google');
  handler.buildMap({
    provider: { styles: mapStyle },
    internal: {id: 'map'}}, function(){
    markers = handler.addMarkers(points);
    handler.bounds.extendWith(markers);
    handler.fitMapToBounds();
    handler.getMap().setZoom(5);
  });

});

