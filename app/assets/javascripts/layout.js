$(document).ready(function {
  $("#").mouseenter(function() {
    $.getJSON('/users/checkins', function(data) {
      newMarkers = data
    })
  });
  $("#").mousedown(function() {
    updateMap();
  });
});

// <div id="show" class="button">Map</div>
// <div id="character" class="button">Character</div>
// <div id="quests" class="button">Quests</div>
// <div id="logout" class="button">Logout</div>