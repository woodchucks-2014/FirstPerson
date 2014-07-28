var newMarkers;
var oldMarkers;
var handler;
var geolocation;

buildMap = function() {
  handler = Gmaps.build('Google');
  handler.buildMap(
    { internal: {id: 'map'} },
    function() {
      // markers = handler.addMarkers(quests);
      handler.bounds.extendWith(markers);
      handler.fitMapToBounds();
    }
  );
}

$(document).ready(function() {

  $("#show_user_quests").hide();
  $("#show_active_quests").click(function() {
    $("#show_user_quests").slideDown()
  });



  $("#show_user_checkins").mouseenter(function() {
    // Preloading data FTW!
    $.getJSON('user/checkins', function(data) {
      newMarkers = data
    })
  });
  $("#show_user_checkins").click(function() {
    handler.removeMarkers(oldMarkers);
    oldMarkers = handler.addMarkers(newMarkers);
  });



  $("#show_all_quests").mouseenter(function() {
    // Preloading data FTW!
    $.getJSON('/quests/all', function(data) {
      newMarkers = data
    })
  });
  $("#show_all_quests").click(function() {
    handler.removeMarkers(oldMarkers);
    oldMarkers = handler.addMarkers(newMarkers);
  });



  $("#show_completed_quests").click(function() {
    createCheckIns();
  });
});