$(document).on('turbolinks:load', function() {
    listSongs()
    nextSong()
    // previousSong()
    // loadSongIndexes()
  })

// Cat index on User home
// the second argument of .getJSON is the function you call on the result of the query to the endpoint (in this case /songs)
function listSongs () {
  $.getJSON("/songs", function(songs){
    $.each(songs, function(index, song) {
      $("#song_list").append(
                            "<li>" + "<a href=\"/users/" + song.user_id + "/songs/" + song.id + "\">" + song.name + "</a>" + " - " + song.artist + "</li>")
    })
  })
}

function nextSong () {
  $("#link_to_next").click(function () {
    $.getJSON(`/songs/${current_song_id}/next`, function(next_song) {
      $("#song_name").replaceWith(next_song.name)
    })
  })
}