var Map = {
  lines: [],
  newMarkers: null,
  oldMarkers: null,
  handler: null
  // var geolocation;
}

function removePolylines() {
  for (var i = 0; i < Map.lines.length; i++ ) {
    Map.lines[i].setMap();
  }
}

function updateMap() {
  removePolylines()
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