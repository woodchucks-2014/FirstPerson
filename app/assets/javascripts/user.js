$(document).ready(function(){


  // $("#stats_but").on("click", function(){
  //   $.ajax({
  //     type: "get",
  //     url: "/stats"
  //   }).done(function(data) {
  //     $("#content").html(data)
  //   }).fail(function() {
  //     alert("Please try again");
  //   })

  // })


  // $("#invent_but").on("click", function(){
  //   $.ajax({
  //     type: "get",
  //     url: "/inventory"
  //   }).done(function(data) {
  //     $("#content").html(data)
  //   }).fail(function() {
  //     alert("Please try again");
  //   })

  // })


  // $("#class_but").on("click", function(){
  //   $.ajax({
  //     type: "get",
  //     url: "/class"
  //   }).done(function(data) {
  //     $("#content").html(data)
  //   }).fail(function() {
  //     alert("Please try again");
  //   })

  // })



  $("#xp_but").on("click", function(){
    $.ajax({
      type: "get",
      url: "/xp"
    }).done(function(data) {
      $("#content").html(data)
    }).fail(function() {
      alert("Please try again");
    })

  })



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
