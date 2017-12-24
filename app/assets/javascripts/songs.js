$(document).on('turbolinks:load', function() {
    listSongs()
    nextSong()
    previousSong()
    loadSongIndexes()
  })

// Cat index on User home
function listSongs () {
  $.getJSON("/songs", function(songs){
    $.each(songs, function(index, song) {
      $("#song_list").append(
                            "<li>" + "<a href=\"/users/" + song.user_id + "/songs/" + song.id + "\">" + song.name + "</a>" + " - " + song.artist + "</li>")
    })
  })
}

function nextSong () {
  $.getJSON("/songs/:id/next", function(next_song) {
    $("#song_name").replaceWith(next_song.name)
  })
}

$("#link_to_next").click (nextSong)