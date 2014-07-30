function showNotice() {
  $("#notification").show()
  setTimeout(function() { $("#notification").fadeOut() }, 2000)
  return "ok"
}

function changeNotice(notice) {
  $("#notification").html("<h1>" + notice.title + "</h1>" + notice.content);
  showNotice();
}

$(document).ready(function() {

  $('.psuedo_link').click(function(e) {
    window.location.href = $(this).attr('href');
  });

  $("#notification").hide()
  setInterval(function() {
    $.getJSON("/users/notifications", function(data) {
      if (data != false) {
        changeNotice(data[0])
        showNotice();
      }
    })
  }, 500)
});
