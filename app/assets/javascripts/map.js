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

$(document).ready(function(){
  $.ajaxSetup({
    async: false
  });

var points = [];
  $.getJSON("/checkins", function(data){
    points = data;
  });

  handler = Gmaps.build('Google');
  handler.buildMap({
    provider: { styles: mapStyle },
    internal: {id: 'map'}}, function(){
    var markers = handler.addMarkers([points]);
    handler.bounds.extendWith(markers);
    handler.fitMapToBounds();
  });

});
/////////////////////////////


$(document).ready(function() {
  var map;
  function initialize() {
    var mapOptions = {
      //center: new google.maps.LatLng(58, 16),
      zoom: 7,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    map = new google.maps.Map(document.getElementById("map"), mapOptions);
  }
  
  $.getJSON("/checkins", function(json1) {
    $.each(json1, function(key, data) {
      var latLng = new google.maps.LatLng(data.lat, data.lng); 
      // Creating a marker and putting it on the map
      var marker = new google.maps.Marker({
          position: latLng,
          //title: data.title
      });
      marker.setMap(map);
    });
  });
});

