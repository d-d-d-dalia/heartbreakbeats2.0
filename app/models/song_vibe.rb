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
    @most_severe_vibes = self.all.select do |s_v|
      s_v.level == 5 && s_v.song.user_id == user_id
    end
  end

end