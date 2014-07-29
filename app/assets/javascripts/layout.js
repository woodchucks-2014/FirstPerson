$(document).ready(function() {
  $("#show").click(function() {
    window.location.href = '/map';
  });

  $("#charater").click(function() {
    window.location.href = '/users/profile';
  });

  $("#quests").click(function() {
    window.location.href = '/users/quests';
  });

  $("#logout").click(function() {
    window.location.href = '/logout';
  });
});

// <div id="show" class="button">Map</div>
// <div id="character" class="button">Character</div>
// <div id="quests" class="button">Quests</div>
// <div id="logout" class="button">Logout</div>