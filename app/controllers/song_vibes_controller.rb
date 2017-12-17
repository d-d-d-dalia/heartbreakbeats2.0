class SongVibesController < ApplicationController

	def most_severe_vibes
		@user = current_user
		@song_hash = SongVibe.highest_level(current_user.id)
	end

end