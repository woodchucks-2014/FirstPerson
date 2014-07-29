var newMarkers;
var oldMarkers;
var lines = [];
var handler;
var geolocation;

function removePolylines() {
  for (var i = 0; i < lines.length; i++ ) {
    lines[i].setMap();
  }
}

function updateMap() {
  removePolylines()
  handler.removeMarkers(oldMarkers);
  oldMarkers = handler.addMarkers(newMarkers);
  handler.bounds.extendWith(oldMarkers);
  handler.fitMapToBounds();
}

function createMap() {
  handler = Gmaps.build('Google');
  handler.buildMap({ internal: {id: 'map'} }, function(){
    if(navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(displayMap);
    }
  });
}

function displayMap(position){
  mark = handler.addMarker({
    lat: position.coords.latitude,
    lng: position.coords.longitude
  });
  handler.map.centerOn(mark);
  handler.removeMarker(mark);
};

$(document).ready(function() {
  createMap();
});
