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
var foursquare_data = {};
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

  $(".create").on("submit", "#check_create", function(e){
    e.preventDefault();
    $.ajax({
      type: "post",
      url: "/set_location",
      data: $( this ).serialize()
    }).done(function(data) {
      foursquare_data = data;
      var i = 0;
      $.each(data, function(key, value){
        $('.create').append("<a class='location' id=" + value["foursquare_id"] + "><div class = 'result'>"+key+"<br>"+value["street"]+"<br></div></a>");
        i++;
      })
    }).fail(function() {
      alert("Please try again");
    })
  })

  $(".create").on("click", ".location", function(e){
    e.preventDefault();
    var index = $(this).id;
    $.post('/commit_location', {foursquare_data[index]})
  })

})
