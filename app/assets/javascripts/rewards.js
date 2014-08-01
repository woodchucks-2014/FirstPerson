$(document).ready(function(){

  $.getJSON('/users/expbar', function(data){
    exp = (data.exp * .1)
    $('#expbar').css("width", exp.toString() + "%")
  })


  $(document).on("click", "#rewards_but", function(){
    $.ajax({
      type: "get",
      url: "/rewards/show"
    }).done(function(data) {
      $("#content").html(data)
    }).fail(function() {
      alert("Please try again");
    })

  })



})
