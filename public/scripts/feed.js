$(document).ready(function() {
  var lastEventID = 0;

  function popEvent(callback) {
    $("#feed/div.event:first").fadeOut(function() {
      $(this).fadeOut(function() { $(this).remove(); });

      callback();
    });
  }

  function pushEvent(new_event) {
    // add element creation code
  }

  function pullEvents() {
    $.getJSON("/events/latest/" + lastEventID, function(data) {
      $.each(data.events, function(new_event) {
        popEvent(function() { pushEvent(new_event); });
      });
    });
  }
});
