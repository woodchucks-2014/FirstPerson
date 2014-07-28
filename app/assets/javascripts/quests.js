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
      $.each(data, function(key, value){
        $('.create').append("<a class='location' id=" + key + "><div class = 'result'>"+value["name"]+"<br>"+value["street"]+"<br></div></a>");
      })
    }).fail(function() {
      alert("Please try again");
    })
  })

  $(".create").on("click", ".location", function(e){
    var index = $(this).attr('id');
    console.log(index);
    $.post('/commit_location', {"venue": foursquare_data[index]})
      .done(function(data){
        console.log(data);
      })
  })

})
