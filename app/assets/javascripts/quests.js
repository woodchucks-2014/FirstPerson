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

  $('#quest_des').submit(function(e){
    e.preventDefault();

    $.ajax({
      type: "post"
      url: "/create",
      data: $( this ).serialize()
    }).done(function() {
      // $('.create').hide();
      // $('.checkpoints_create').show();
    })
    .fail(function() {
            alert("Please try again");
        })

  })


})
