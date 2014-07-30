$(document).ready(function(){


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
