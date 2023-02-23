$(document).ready(function() {
  $('#call-btn').on('ajax:success', function() {
    location.reload();
  });
  
  $('#call-btn').on('click', function(e) {
    e.preventDefault();
    var url = $(this).attr('href');
    $.ajax({
      url: url,
      type: 'DELETE',
      success: function() {
        $('#wait-info').load(location.href + ' #wait-info');
        $('#call_audio')[0].play();
      }
    });
  });
});