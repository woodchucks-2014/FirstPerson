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

function updateMap() {
  Map.removePolylines()
  Map.handler.removeMarkers(Map.oldMarkers);
  Map.oldMarkers = Map.handler.addMarkers(Map.newMarkers);
  Map.handler.bounds.extendWith(Map.oldMarkers);
  Map.handler.fitMapToBounds();
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