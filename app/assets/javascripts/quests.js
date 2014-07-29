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
    $.post('/commit_location', {"venue": foursquare_data[index]})
      .done(function(data){
        console.log(data)
        //window.location.href = data.redirect;
      })
  })

  $("#active_but").on("click", function(){
    $.ajax({
      type: "get",
      url: "quests#active_quests"
    }).done(function(data) {
      })
    }).fail(function() {
      alert("Please try again");
    })

  })


  // $("#all_but").on("click", ".location", function(e){
  //   var index = $(this).attr('id');
  //   $.post('/commit_location', {"venue": foursquare_data[index]})
  //     .done(function(data){
  //       console.log(data)
  //       //window.location.href = data.redirect;
  //     })
  // })



  // $("#comp_but").on("click", ".location", function(e){
  //   var index = $(this).attr('id');
  //   $.post('/commit_location', {"venue": foursquare_data[index]})
  //     .done(function(data){
  //       console.log(data)
  //       //window.location.href = data.redirect;
  //     })
  // })


  // $("#sort_but").on("click", ".location", function(e){
  //   var index = $(this).attr('id');
  //   $.post('/commit_location', {"venue": foursquare_data[index]})
  //     .done(function(data){
  //       console.log(data)
  //       //window.location.href = data.redirect;
  //     })
  // })

  // $("#edit_quest_but").on("click", ".location", function(e){
  //   var index = $(this).attr('id');
  //   $.post('/commit_location', {"venue": foursquare_data[index]})
  //     .done(function(data){
  //       console.log(data)
  //       //window.location.href = data.redirect;
  //     })
  // })


  // $("#create_but").on("click", ".location", function(e){
  //   var index = $(this).attr('id');
  //   $.post('/commit_location', {"venue": foursquare_data[index]})
  //     .done(function(data){
  //       console.log(data)
  //       //window.location.href = data.redirect;
  //     })
  // })

})
