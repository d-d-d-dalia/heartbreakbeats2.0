$(document).on('turbolinks:load', function() {
    listSongs()
    nextSong()
    editSong()
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
      history.pushState(next_song, "", `/users/${next_song.user_id}/songs/${next_song.id}`)
      // we are iterating thru song_vibes and for each one, we are scanning the vibes array to find the one with the matching id so we can pull out it's name
      // can check songs/:id/next to view song object to get an idea
      next_song.song_vibes.forEach (function(s_v) {
        next_song.vibes.forEach (function (v) {
          if (s_v.vibe_id === v.id) {
            $("#song_vibes").append(
              //formatter is going to replace the below code with a function call which would return this string
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
    var songId = this.dataset.id
    var songUserId = this.dataset.user
    $.get(`/songs/${songId}/edit`, function(data){
      $('#all_song_info').html(data)
      // ? : WHAT DO I WANT IN THE PLACE OF SONGID HERE? WHY IS THIS WORKING EXACTLY? BECAUSE THAT DOESN'T REFER TO THE ENTIRE SONG OBJECT AND ITS ATTRIBUTES, BUT ONLY TO THE SONG ID
      history.pushState(songId, "", `/users/${songUserId}/songs/${songId}/edit`)
    })
  })
}