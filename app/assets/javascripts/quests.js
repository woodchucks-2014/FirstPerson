var marks = "test";

$.getJSON( "/all.json", function(data) {
    marks = data
  });

$(document).ready(function(){


  handler = Gmaps.build('Google');
  handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
    markers = handler.addMarkers(marks);
    // lines = handler.addPolylines(
    //   [marks],
    //   { strokeColor: '#FF0000'}
    // );
    handler.bounds.extendWith(markers);
    handler.fitMapToBounds();
  });

  $.ajax({
  url: "test.html",
  context: document.body
}).done(function() {
  $( this ).addClass( "done" );
});


})
