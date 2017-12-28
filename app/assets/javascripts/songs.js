$(document).on('turbolinks:load', function() {
    listSongs()
    nextSong()
    editSong()
    // loadSongIndexes()
  })

// Song index on User home
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
      $("#song_name").text(next_song.name)
      $("#song_artist").text(next_song.artist)
      $("#song_vibes").text("")
      // we are iterating thru song_vibes and for each one, we are scanning the vibes array to find the one with the matching id so we can pull out it's name
      // can check songs/:id/next to view song object to get an idea
      next_song.song_vibes.forEach (function(s_v) {
        next_song.vibes.forEach (function (v) {
          if (s_v.vibe_id === v.id) {
            $("#song_vibes").append(
                                    "<p>" + v.name + " level: " + s_v.level + "</p>")
          }
        })
      }) 
      current_song_id = next_song.id
    })
  
  })
}

function editSong () {
  $("#edit").click(function () {
    console.log(this.dataset);
    var songId = this.dataset.id;
    $.get(`/songs/${songId}/edit`, (data) => {
      $('#all_song_info').html(data);
    })
    // $.getJSON(`/songs/${current_song_id}/edit_song`, function(edited_song) {
      
    // })
  })

}