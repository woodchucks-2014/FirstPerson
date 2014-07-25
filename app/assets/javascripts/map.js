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

$(document).ready(function(){

  var latlng =''
    $.getJSON('/testpush', function(data){
      latlng = data;
    })

  handler = Gmaps.build('Google');
  handler.buildMap({ 
    provider: {
              styles: mapStyle
              }, 

    internal: {id: 'map'}}, function(){

    markers = handler.addMarkers([
      {
        "lat": latlng.lat,
        "lng": latlng.long,
        "picture": {
          "url": "https://i.imgur.com/2FqzEFz.png",
          "width":  64,
          "height": 64
        },
      }
    ]);
      handler.map.centerOn(markers[0]);
    handler.getMap().setZoom(3);
  });
})
