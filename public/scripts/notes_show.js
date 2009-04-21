$(document).ready(function() {
  $("a.post_comment").click(function() {
    $("#comment_form").slideToggle();
  });

  $("#comment_form").hide();
});
