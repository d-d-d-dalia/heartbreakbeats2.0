class SongVibe < ApplicationRecord

  belongs_to :song
  belongs_to :vibe

  validates :level, inclusion: {in: 1..5}
  validates :level, numericality: {only_integer: true}

  # each vibe_id can appear in a song once
  # song_vibe is validating that the vibe it is associated with is unique in relation to the song it is being associated with
  validates_uniqueness_of :vibe_id, scope: :song_id

  def vibe_attributes=(vibe_selections)
    # this is only necessary because of the uniqueness requirement of vibe based on its name
    vibe_selections.each do |key, value|
      if value != "" && Vibe.find_by(name: value)
        self.vibe_id = Vibe.find_by(name: value).id
      else
        self.vibe = Vibe.create(name: value)
      end
    end
  end

  def self.highest_level(user_id)
    song_hash = {}
    most_severe_vibes = self.all.select do |s_v|
      s_v.level == 5 && s_v.song.user_id == user_id
    end

    most_severe_vibes.each do |song_vibe|
      song = Song.find(song_vibe["song_id"])
      vibe = Vibe.find(song_vibe["vibe_id"])
      # this is checking to make sure that vibe doesn't already appear in the hash and if it doesn't, it sets it to an empty array
      song_hash[vibe.name] = song_hash[vibe.name] || []
      # e.g., this is the first time thru
      # {
      #   "loss": []
      # }  
      # this syntax is how you push a value into a hash
      # what is inside the parens evaluates to a empty array bc of line 34. pushing song into an array, and that array is inside the hash, as the value of the vibe name key
      (song_hash[vibe.name]) << song
    end
    song_hash
  end

end