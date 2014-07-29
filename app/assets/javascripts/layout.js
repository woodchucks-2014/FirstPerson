function showNotice() {
  $("#notification").show()
  setTimeout(function() { $("#notification").fadeOut() }, 2000)
  return "ok"
}

$(document).ready(function() {

  $('.psuedo_link').click(function(e) {
    window.location.href = $(this).attr('href');
  });

  $("#notification").hide()
});
