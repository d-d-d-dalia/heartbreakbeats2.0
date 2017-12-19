$(document).ready(function() {
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
                            "<li>" + "<a href=\"/songs/" + song.id + "\">" + song.name + "</a>" + "</li>")
    })
  })
}
