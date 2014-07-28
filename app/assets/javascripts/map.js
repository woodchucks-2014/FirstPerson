//"/all.json"

function getMarkers() {
  $.getJSON("/all", function(data) {
    handler.removeMarkers(markers)
    markers = handler.addMarker(quests);
    handler.bounds.extendWith(markers);
    handler.fitMapToBounds();
  })
}

function createMap() {
  handler = Gmaps.build('Google');
  handler.buildMap({ internal: {id: 'map'} }, function(){
    if(navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(displayMap);
    }
  })
}

function setGeo(posion) {

}

function displayMap(position){
  mark = handler.addMarker({
    lat: position.coords.latitude,
    lng: position.coords.longitude
  });
  handler.map.centerOn(mark);
  handler.removeMarker(mark);
};

// function displayMarkers(path) {
//   markers = handler.addMarker(markers);
//   handler.bounds.extendWith(markers);
//   handler.fitMapToBounds();
// }

$(document).ready(function() {
  createMap();
})