$(document).ready(function() {
  $('#call-btn').on('click', function(e) {
    e.preventDefault();
    var url = $(this).attr('href');
    var csrfToken = $('meta[name="csrf-token"]').attr('content');
    $.ajax({
      url: url,
      type: 'DELETE',
      headers: { 'X-CSRF-Token': csrfToken },
      success: function() {
        $('#wait-info').load(location.href + ' #wait-info', function() {
          if ($('#wait-info .patient').length == 0) {
            location.reload();
          } else {
            var callAudio = document.getElementById('call_audio');
            callAudio.play();
            $('#wait-info .patient').first().remove(); // 待ちリストの先頭の患者を削除する
          }
        });
      }
    });
  });
});
