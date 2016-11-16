$(document).on('turbolinks:load', function() {
  $('.list-group .list-group-item').click(function(event){
    event.preventDefault();
    $.getScript('/?musical_instrument_id=' + $(this).data('id'));
    return;
  });
});

$(document).on('turbolinks:load', function() {
  $('.edit_comment').click(function(event) {
    event.preventDefault();
    $.getScript('/comments/' + $(this).data('id') + '/edit')
  });
});

$(document).on('turbolinks:load', function() {
  $('body').on('click','.search', function(e){
    var search;
    e.preventDefault();
    search = document.getElementById('search_form');
    $.getScript('/?q=' + search.value);
  })
});

$(document).on('turbolinks:load', function() {
  $('body').on('keypress','.form',function (event) { 
    if (event.which == 13) { 
      $(this).find('.search').click(); 
      return false; 
    }
  });
});
$(document).on('turbolinks:load', function() {
  $('.show_more_button').on('click', function(e){
    e.preventDefault();
    var c = $(this).parent().parent().children();
    $(c[0]).show();
    $(c[1]).hide();
  })
});
