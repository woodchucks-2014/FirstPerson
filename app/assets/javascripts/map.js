var Map = {
  lines: [],
  newMarkers: null,
  oldMarkers: null,
  handler: null
}

Map.mapStyle =[
  {
    "featureType": "landscape",
    "stylers": [
      { "visibility": "off" },
      { "color": "#CAE6C8" }
    ]
  },{
    "featureType": "landscape.man_made",
    "stylers": [
      { "visibility": "on" },
      { "color": "#339933" }
    ]
  },{
    "featureType": "landscape.natural",
    "stylers": [
      { "color": "#339933" },
      { "visibility": "on" }
    ]
  },{
    "featureType": "landscape.natural.terrain",
    "stylers": [
      { "visibility": "on" },
      { "color": "#339933" }
    ]
  },{
    "featureType": "transit.line",
    "stylers": [
      { "visibility": "off" }
    ]
  },{
    "featureType": "poi",
    "elementType": "labels.text",
    "stylers": [
      { "visibility": "off" }
    ]
  },{
    "featureType": "transit",
    "stylers": [
      { "visibility": "off" }
    ]
  },{
    "featureType": "water",
    "elementType": "labels.text",
    "stylers": [
      { "visibility": "off" }
    ]
  },{
    "featureType": "transit",
    "elementType": "labels",
    "stylers": [
      { "visibility": "off" }
    ]
  },{
    "featureType": "road.arterial",
    "stylers": [
      { "visibility": "on" }
    ]
  },{
    "featureType": "road.highway",
    "stylers": [
      { "color": "#808080" }
    ]
  },{
    "featureType": "road.highway",
    "elementType": "labels.icon",
    "stylers": [
      { "visibility": "off" }
    ]
  },{
    "featureType": "road.arterial",
    "elementType": "labels",
    "stylers": [
      { "visibility": "off" }
    ]
  },{
    "featureType": "water",
    "elementType": "labels",
    "stylers": [
      { "visibility": "off" }
    ]
  },{
    "featureType": "road",
    "stylers": [
      { "visibility": "on" },
      { "weight": 0.1 },
      { "color": "#222222" }
    ]
  },{
    "featureType": "road",
    "elementType": "labels.icon",
    "stylers": [
      { "visibility": "off" }
    ]
  },{
    "featureType": "road",
    "elementType": "labels.text",
    "stylers": [
      { "visibility": "on" },
      { "color": "#FFFFFF" }
    ]
  },{
    "featureType": "poi.medical",
    "stylers": [
      { "visibility": "off" }
    ]
  },{
    "featureType": "administrative.locality",
    "stylers": [
      { "visibility": "on" }
    ]
  },{
    "featureType": "water",
    "elementType": "geometry",
    "stylers": [
            {
                "hue": "#00B6FF"
            },
            {
                "saturation": 4.2
            },
            {
                "lightness": -63.4
            },
            {
                "gamma": 1
            }
        ]
  },{
    "featureType": "poi",
    "elementType": "geometry",
    "stylers": [
      { "color": "#339933" }
    ]
  },{
    "featureType": "administrative",
    "elementType": "labels.text.stroke",
    "stylers": [
      { "visibility": "off" }
    ]
  },{
    "featureType": "administrative",
    "elementType": "labels.text.fill",
    "stylers": [
      { "color": "#F5DC6E" }
    ]
  },{
    "featureType": "landscape"  },{
  }
]
Map.addPolylines = function() {
  this.lines = this.handler.addPolylines(
    [this.newMarkers],
    { strokeColor: '#FF2B2B' }
  );
}

Map.removePolylines = function() {
  for (var i = 0; i < this.lines.length; i++ ) {
    this.lines[i].setMap();
  }
}

Map.updateMap = function() {
  this.removePolylines()
  this.handler.removeMarkers(this.oldMarkers);
  this.oldMarkers = this.handler.addMarkers(this.newMarkers);
  this.handler.bounds.extendWith(this.oldMarkers);
  this.handler.fitMapToBounds();
}

Map.createMap = function() {
  self = this
  this.handler = Gmaps.build('Google');
  this.handler.buildMap({ internal: {id: 'map'} ,
      provider: {
      styles: this.mapStyle
    }}, function(){
    if(navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(self.displayMap);
    }
  });
}

Map.displayMap = function(position) {
  self = Map
  mark = self.handler.addMarker({
    lat: position.coords.latitude,
    lng: position.coords.longitude
  });
  self.handler.map.centerOn(mark);
  self.handler.removeMarker(mark);
};

Map.getData = function(path) {
  self = this
  $.getJSON(path, function(data) {
    self.newMarkers = data
  })
}

$(document).ready(function() {

  try { Map.createMap() } catch(err) {}
});

