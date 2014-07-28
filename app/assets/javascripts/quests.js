var quests;
$.getJSON( "/all.json", function(data) {
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
      handler.bounds.extendWith(markers);
      handler.fitMapToBounds();
    }
  );
}

$(document).ready(function(){

  $('#new_quest').submit(function(e){
    e.preventDefault();
    $.ajax({
      type: "post",
      url: "/create",
      data: $( this ).serialize()
    }).done(function(data) {
      $('.create').html(data);
    }).fail(function() {
      alert("Please try again");
    })
  })

  $('#check_create').submit(function(e){
    e.preventDefault();
    $.ajax({
      type: "post",
      url: "/set_location",
      data: $( this ).serialize()
    }).done(function(data) {
      console.log(data);
      $.each(data, function(i, value){
        $('.create').append("<button id=" + i + ">"+value[i].name+"</button>");
      })
    }).fail(function() {
      alert("Please try again");
    })
  })

})
