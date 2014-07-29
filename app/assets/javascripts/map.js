var Map = {
  lines: [],
  newMarkers: null,
  oldMarkers: null,
  handler: null
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

function createMap() {
  Map.handler = Gmaps.build('Google');
  Map.handler.buildMap({ internal: {id: 'map'} }, function(){
    if(navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(displayMap);
    }
  });
}

function displayMap(position){
  mark = Map.handler.addMarker({
    lat: position.coords.latitude,
    lng: position.coords.longitude
  });
  Map.handler.map.centerOn(mark);
  Map.handler.removeMarker(mark);
};

$(document).ready(function() {
  createMap();
});