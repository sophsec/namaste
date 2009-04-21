$(document).ready(function() {
  $("a.show_syntax").click(function() {
    $("#textile_syntax").slideToggle("normal", function() {
      $("#textile_syntax").focus();
    });
  });

  $("#textile_syntax").hide();
  $("#notes_form/input:first").focus();
});
