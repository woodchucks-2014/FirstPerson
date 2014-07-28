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
var geolocation = "hello";

function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(assignPosition);
    } else {
        alert("Geolocation is not supported by this browser.")
    }
}
function assignPosition(position) {
    geolocation = {lat: position.coords.latitude, lng: position.coords.longitude} 
}

getLocation();

createMap = function(gl) {
  handler = Gmaps.build('Google');
  handler.buildMap({ internal: {id: 'map' }});
  var mark = handler.addMarker(gl);
  handler.map.centerOn(mark);
  handler.removeMarker(mark);
}

$(document).ready(function() {
  console.log(geolocation)
  createMap(geolocation);
})