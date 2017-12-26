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
    // event.preventDefault()
    $.getJSON(`/songs/${current_song_id}/next`, function(next_song) {
      console.log(next_song)
      console.log("hi")
      $("#song_name").text(next_song.name)
      $("#song_artist").text(next_song.artist)
      $("#song_vibes").text(next_song.vibes)
      current_song_id = next_song.id
      // $("#link_to_next").off("click")
    })
  })
}


// use a constructor and the constructor will construct JS objects
// have to make a class
// all of the JSON responses need to be in the form of model objects where you use a constructor