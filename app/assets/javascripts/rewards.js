$(document).ready(function(){

  $('#character_rewards').on('click', function(e){
    e.preventDefault();
    $.ajax({
      type: "post",
      url: "/rewards/show"
      success: function(response) {
        
      }
    })

    // alert("hi")

    // $.ajax({
    //   type: "post",
    //   url: "/create",
    //   data: $( this ).serialize()
    // }).done(function(data) {
    //   $('.create').html(data);
    // }).fail(function() {
    //   alert("Please try again");
    })
  })