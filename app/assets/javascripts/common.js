$(document).on('turbolinks:load', function() {
  $(".list-group .list-group-item").unbind("click").click(function(){
    $.getScript("/?musical_instrument_id=" + $(this).data("id"));
    return;
  });
});
