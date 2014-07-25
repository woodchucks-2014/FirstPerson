$(document).ready(function(){
  handler = Gmaps.build('Google');
  handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
    markers = handler.addMarkers([
      {
        "lat": 40.7903,
        "lng": -73.9597,
        "picture": 
        {
          "url": "http://i.imgur.com/2FqzEFz.png",
          "width":  64,
          "height": 64
        },
        //"infowindow": "hello!"
      }, {
        "lat": 40.75020,
        "lng": -73.9807
      }
    ]);
    handler.bounds.extendWith(markers);
    handler.fitMapToBounds();
  });
})
