setTimeout ->
  $('#add_playlists').click ->
    $(this).hide()
    $('#new_movie').show(100)
, 1000
