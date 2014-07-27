var mapStyle = [
  {
    "elementType": "labels.icon",
    "stylers": [
      { "visibility": "off" }
    ]
  },
  {
    "featureType": "water",
    "stylers": [
      {
        "color": "#021019"
      }
    ]
  },
  {
    "featureType": "landscape",
    "stylers": [
      {
        "color": "#08304b"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#0c4152"
      },
      {
        "lightness": 5
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry.fill",
    "stylers": [
      {
        "color": "#0b434f"
      },
      {
        "lightness": 16
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry.stroke",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "road.arterial",
    "elementType": "geometry.fill",
    "stylers": [
      {
        "color": "#0b3d51"
      },
      {
        "lightness": 16
      }
    ]
  },
  {
    "featureType": "road.arterial",
    "elementType": "geometry.stroke",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "road.local",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#000000"
      }
    ]
  },
  {
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#ffffff"
      }
    ]
  },
  {
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#000000"
      },
      {
        "lightness": 13
      }
    ]
  },
  {
    "featureType": "transit",
    "stylers": [
      {
        "color": "#146474"
      }
    ]
  },
  {
    "featureType": "administrative",
    "elementType": "geometry.fill",
    "stylers": [
      {
        "color": "#000000"
      }
    ]
  },
  {
    "featureType": "administrative",
    "elementType": "geometry.stroke",
    "stylers": [
      {
        "color": "#144b53"
      },
      {
        "lightness": 14
      },
      {
        "weight": 1.4
      }
    ]
  }
]

var marks;
$.getJSON( "/checkins", function(data) {
  marks = data
});

createMap = function() {
  handler = Gmaps.build('Google');
  handler.buildMap(
    { 
      provider: { 
        styles: mapStyle
      }, 
      internal: {id: 'map'}
    }, 
    function() {
      markers = handler.addMarkers(marks);
      lines = handler.addPolylines(
        [marks],
        { strokeColor: '#00BB00' }
      );
      handler.bounds.extendWith(markers);
      handler.fitMapToBounds();
    }
  );
}

$(document).ready(function() {

  createMap();

})

