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

var marks;
$.getJSON( "/checkins", function(data) {
  marks = data
});
console.log(marks)

$(document).ready(function() {

  // handler = Gmaps.build('Google');
  // handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
  //   markers = handler.addMarkers(marks);
  //   lines = handler.addPolylines(
  //     [marks],
  //     { strokeColor: '#FF0000'}
  //   );
  //   handler.bounds.extendWith(markers);
  //   handler.fitMapToBounds();
  // });

})

