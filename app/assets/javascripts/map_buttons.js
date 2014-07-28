var newMarkers;
var oldMarkers = [];
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
    $("#show_user_quests").show()
  });

  $("#show_user_checkins").click(function() {
    createCheckIns();
  });
  $("#show_all_quests").mouseenter(function() {
    $.getJSON('/all', function(data) {
      newMarkers = data
    })
  })
  $("#show_all_quests").click(function() {
    handler.addMarkers(newMarkers);
    handler.removeMarkers(oldMarkers);
    oldMarkers = newMarkers
  });
  $("#show_completed_quests").click(function() {
    createCheckIns();
  });
});