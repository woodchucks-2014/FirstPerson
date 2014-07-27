var quests;
$.getJSON( "/quests", function(data) {
  quests = data
});

createQuests = function() {
  handler = Gmaps.build('Google');
  handler.buildMap(
    { 
      provider: { 
        styles: mapStyle
      }, 
      internal: {id: 'map'}
    }, 
    function() {
      markers = handler.addMarkers(quests);
      lines = handler.addPolylines(
        [quests],
        { strokeColor: '#00BB00' }
      );
      handler.bounds.extendWith(markers);
      handler.fitMapToBounds();
    }
  );
}