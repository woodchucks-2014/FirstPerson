// var mapStyle = [
//   {
//     "elementType": "labels.icon",
//     "stylers": [
//       { "visibility": "off" }
//     ]
//   },
//   {
//     "featureType": "water",
//     "stylers": [
//       {
//         "color": "#021019"
//       }
//     ]
//   },
//   {
//     "featureType": "landscape",
//     "stylers": [
//       {
//         "color": "#08304b"
//       }
//     ]
//   },
//   {
//     "featureType": "poi",
//     "elementType": "geometry",
//     "stylers": [
//       {
//         "color": "#0c4152"
//       },
//       {
//         "lightness": 5
//       }
//     ]
//   },
//   {
//     "featureType": "road.highway",
//     "elementType": "geometry.fill",
//     "stylers": [
//       {
//         "color": "#0b434f"
//       },
//       {
//         "lightness": 16
//       }
//     ]
//   },
//   {
//     "featureType": "road.highway",
//     "elementType": "geometry.stroke",
//     "stylers": [
//       {
//         "visibility": "off"
//       }
//     ]
//   },
//   {
//     "featureType": "road.arterial",
//     "elementType": "geometry.fill",
//     "stylers": [
//       {
//         "color": "#0b3d51"
//       },
//       {
//         "lightness": 16
//       }
//     ]
//   },
//   {
//     "featureType": "road.arterial",
//     "elementType": "geometry.stroke",
//     "stylers": [
//       {
//         "visibility": "off"
//       }
//     ]
//   },
//   {
//     "featureType": "road.local",
//     "elementType": "geometry",
//     "stylers": [
//       {
//         "color": "#000000"
//       }
//     ]
//   },
//   {
//     "elementType": "labels.text.fill",
//     "stylers": [
//       {
//         "color": "#ffffff"
//       }
//     ]
//   },
//   {
//     "elementType": "labels.text.stroke",
//     "stylers": [
//       {
//         "color": "#000000"
//       },
//       {
//         "lightness": 13
//       }
//     ]
//   },
//   {
//     "featureType": "transit",
//     "stylers": [
//       {
//         "color": "#146474"
//       }
//     ]
//   },
//   {
//     "featureType": "administrative",
//     "elementType": "geometry.fill",
//     "stylers": [
//       {
//         "color": "#000000"
//       }
//     ]
//   },
//   {
//     "featureType": "administrative",
//     "elementType": "geometry.stroke",
//     "stylers": [
//       {
//         "color": "#144b53"
//       },
//       {
//         "lightness": 14
//       },
//       {
//         "weight": 1.4
//       }
//     ]
//   }
// ]

var markers;
var handler;
var geolocation;

"/all.json"

function getMarkers(path) {
  $.getJSON(path, function(data) {
    markers = data
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

function displayMap(position){
  markers = handler.addMarker({
    lat: position.coords.latitude,
    lng: position.coords.longitude
  });
  handler.map.centerOn(mark);
};

function displayMarkers(path) {
  handler.removeMarkers(markers);
  getMarkers(path);
  markers = handler.addMarker(markers);
  handler.bounds.extendWith(markers);
  handler.fitMapToBounds();
}

$(document).ready(function() {
  createMap();
  displayMarkers("/all")
})