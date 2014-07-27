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

$(document).ready(function(){

  $(".checkpoints_create").hide();

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
