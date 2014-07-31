var foursquare_data = {};
var location_form;
$(document).ready(function(){

  $("#content").on("submit", "#new_quest", function(e){
    e.preventDefault();
    $.ajax({
      type: "post",
      url: "/create",
      data: $( this ).serialize()
    }).done(function(data) {
      $('#content').html(data);
      location_form = data;
    }).fail(function() {
      alert("Please try again");
    })
  })

  $("#content").on("submit", "#check_create", function(e){
    e.preventDefault();
    $.ajax({
      type: "post",
      url: "/set_location",
      data: $( this ).serialize()
    }).done(function(data) {
      foursquare_data = data;
      $.each(data, function(key, value){
        $('#content').append("<a class='location' href='/add' id=" + key + "><div class = 'result'>"+value["name"]+"<br>"+value["street"]+"<br></div></a>");
      })
    }).fail(function() {
      alert("Please try again");
    })
  })

  $("#content").on("click", ".location", function(e){
    e.preventDefault();
    var index = $(this).attr('id');
    $.post('/commit_location', {"venue": foursquare_data[index]})
      .done(function(data){
        $("#content").html("<div class='success'>" + data + "</div>")
        $("#content").append(location_form)
        $("#content").append("<a href = '/quests' id = 'done'> I'm done adding checkpoints </a>")
      })
  })

  $("#content").on("click", "#done", function(e){
    e.preventDefault();
    location.reload();
  })

  $("#active_but").on("click", function(){
    $.ajax({
      type: "get",
      url: "/active_quests"
    }).done(function(data) {
      $("#content").html(data)
    }).fail(function() {
      alert("Please try again");
    })

  })


  $("#available_but").on("click", function(){
    $.ajax({
      type: "get",
      url: "/available_quests"
    }).done(function(data) {
      $("#content").html(data)
    }).fail(function() {
      alert("Please try again");
    })

  })



  $("#comp_but").on("click", function(){
    $.ajax({
      type: "get",
      url: "/completed_quests"
    }).done(function(data) {
      $("#content").html(data)
    }).fail(function() {
      alert("Please try again");
    })

  })


  $("#created_but").on("click", function(){
    $.ajax({
      type: "get",
      url: "/created_quests"
    }).done(function(data) {
      $("#content").html(data)
    }).fail(function() {
      alert("Please try again");
    })

  })


  $("#sort_but").on("click", function(){
    $.ajax({
      type: "get",
      url: "/sort_quests"
    }).done(function(data) {
      $("#content").html(data)
    }).fail(function() {
      alert("Please try again");
    })

  })

  $("#edit_quest_but").on("click", function(){
    $.ajax({
      type: "get",
      url: "/edit_quests"
    }).done(function(data) {
      $("#content").html(data)
    }).fail(function() {
      alert("Please try again");
    })

  })


  $("#create_quest_but").on("click", function(){
    $.ajax({
      type: "get",
      url: "/create_quests"
    }).done(function(data) {
      $("#content").html(data)
    }).fail(function() {
      alert("Please try again");
    })

  })

})
