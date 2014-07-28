var markers;
var handler;

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
  $("#show_all_quests").click(function() {
    createQuests();
  });
  $("#show_completed_quests").click(function() {
    createCheckIns();
  });
  alert("Hi");
});