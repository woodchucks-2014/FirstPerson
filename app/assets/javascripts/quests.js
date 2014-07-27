var marks = "test";

$.getJSON( "/all.json", function(data) {
    marks = data
  });

$(document).ready(function(){

  $(".checkpoints_create").hide();

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

  $('#new_quest').submit(function(e){
    e.preventDefault();
    $.ajax({
      type: "post",
      url: "/create",
      data: $( this ).serialize()
    }).done(function(data) {
      $('.quest_create').hide();
      $('.checkpoints_create').show();
    }).fail(function() {
      alert("Please try again");
    })
  })


})
