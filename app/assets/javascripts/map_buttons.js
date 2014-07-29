$(document).ready(function() {

  $("#show_user_quests").hide();
  $("#show_active_quests").click(function() {
    $("#show_user_quests").slideDown()
  });

  // Preloading data FTW!
  $("#show_user_checkins").mouseenter(function() {
    $.getJSON('/user_all_checkins_loc', function(data) {
      Map.newMarkers = data
    })
  });
  $("#show_user_checkins").click(function() {
    Map.updateMap();
    Map.lines = Map.handler.addPolylines(
      [Map.newMarkers],
      { strokeColor: '#00BB00' }
    );
  });

  $("#show_all_quests").mouseenter(function() {
    $.getJSON('/quests/all', function(data) {
      Map.newMarkers = data
    })
  });
  $("#show_all_quests").click(function() {
    Map.updateMap();
  });

  $("#show_completed_quests").mouseenter(function() {
    $.getJSON('/quests/completed', function(data) {
      Map.newMarkers = data
    })
  });
  $("#show_completed_quests").click(function() {
    Map.updateMap();
  });
});