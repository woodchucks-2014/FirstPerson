$(document).ready(function() {

  $("#show_user_quests").hide();
  $("#show_active_quests").click(function() {
    $("#show_user_quests").slideDown()
  });

  // Preloading data FTW!
  $("#show_user_checkins").mouseenter(function() {
    Map.getData('/user_all_checkins_loc')
  });

  $("#show_user_checkins").click(function() {
    Map.updateMap();
    Map.addPolylines();
  });

  $("#show_all_quests").mouseenter(function() {
    Map.getData('/quests/all')
  });

  $("#show_all_quests").click(function() {
    Map.updateMap();
  });

  $("#show_completed_quests").mouseenter(function() {
    Map.getData('/user_completed_quests_loc')
  });

  $("#show_completed_quests").click(function() {
    Map.updateMap();
  });
});
