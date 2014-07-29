$(document).ready(function() {
  $("#show").click(function() {
    window.location.href = '/map';
  });

  $("#profile").click(function() {
    window.location.href = '/users/profile';
  });

  $("#quests").click(function() {
    window.location.href = '/quests';
  });

  $("#logout").click(function() {
    window.location.href = '/logout';
  });
});
