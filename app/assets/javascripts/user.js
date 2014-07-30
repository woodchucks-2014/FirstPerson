$(document).ready(function(){


  $("#board_but").on("click", function(){
    $.ajax({
      type: "get",
      url: "/board"
    }).done(function(data) {
      $("#content").html(data)
    }).fail(function() {
      alert("Please try again");
    })

  })

})
