$(document).on('turbolinks:load', function() {
    listSongs()
    nextSong()
    editSong()
  })

function Song(song_json) {
  this.user_id = song_json.user_id
  this.id = song_json.id
  this.name = song_json.name
  this.artist = song_json.artist
  this.song_vibes = song_json.song_vibes
  this.vibes = song_json.vibes
}

Song.prototype.formatSong = function() {
  return "<li>" + "<a href=\"/users/" + this.user_id + "/songs/" + this.id + "\">" + this.name + "</a>" + " - " + this.artist + "</li>"
}

Song.prototype.showAllSongInfo = function() { 
      $("#song_name").text(this.name)
      $("#song_artist").text(this.artist)
      $("#song_vibes").text("")
      // we are iterating thru song_vibes and for each one, we are scanning the vibes array to find the one with the matching id so we can pull out it's name
      // can check songs/:id/next to view song object to get an idea
      this.song_vibes.forEach (function(s_v) {
        this.vibes.forEach (function (v) {
          if (s_v.vibe_id === v.id) {
            $("#song_vibes").append(
                                    "<p>" + v.name + " level: " + s_v.level + "</p>")
          }
        })
      }) 
      current_song_id = this.id
}

// Song index on User home
// the second argument of .getJSON is the function you call on the result of the query to the endpoint (in this case /songs)
function listSongs () {
  $.getJSON("/songs", function(songs){
    $.each(songs, function(index, song) {
      var the_song = new Song(song)
      $("#song_list").append(the_song.formatSong())
    })
  })
}

function nextSong () {
  $("#link_to_next").click(function () {
    $.getJSON(`/songs/${current_song_id}/next`, function(next_song) {
      current_song_id = next_song.id
      var this_song = new Song(next_song)
      this_song.showAllSongInfo()
      history.pushState(this_song, "", `/users/${this_song.user_id}/songs/${the_song.id}`)
    })
  })
}

function editSong () {
  $("#edit").click(function () {
    var songId = this.dataset.id
    var songUserId = this.dataset.user
    $.get(`/songs/${songId}/edit`, function(data){
      $('#all_song_info').html(data)
      history.pushState(data, "", `/users/${songUserId}/songs/${songId}/edit`)
    })
  })
}