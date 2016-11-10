$(document).on('turbolinks:load', function() {
  $(".list-group .list-group-item").click(function(event){
    event.preventDefault();
    $.getScript("/?musical_instrument_id=" + $(this).data("id"));
    return;
  });
});

$(document).on('turbolinks:load', function() {
  $(".edit_comment").click(function(event) {
    event.preventDefault();
    $.getScript("/comments/" + $(this).data("id") + "/edit")
  });
});
