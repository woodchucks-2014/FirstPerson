$(document).ready(function(){
  handler = Gmaps.build('Google');
  handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
    markers = handler.addMarkers([
      {
        "lat": 40.7903,
        "lng": -73.9597,
        "picture": {
          "url": "http://i.imgur.com/2FqzEFz.png",
          "width":  36,
          "height": 36
        },
        //"infowindow": "hello!"
      }
    ]);
    handler.bounds.extendWith(markers);
    handler.fitMapToBounds();
  });
})
