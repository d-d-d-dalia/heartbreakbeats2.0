class VibesController < ApplicationController

# 	def new
#    	@vibe = Vibe.new
#   end

#   def create
#     @song = Song.find(params[:song_id])
#   	@vibe = @song.vibes.build(vibe_params)
# 	end

# 	def edit
#    	@user = User.find(params[:user_id])
#    	@vibe = Vibe.find(params[:id])
#   	@song = @vibe.song
# 	end

#   def update
#    	@vibe = Vibe.find(params[:id])
#     if @vibe.update(vibe_params)
#       flash[:success] = "vibes updated"
#       redirect_to user_path(current_user)
#     else
#       render :edit
#    	end
#  	end

#   def destroy
#     @vibe = Vibe.find(params[:id])
#    	@vibe.destroy
#     # purpose of this is that if you delete a vibe that is associated with songs already, then it will break when trying then to list out the song_vibes, bc they won't have a vibe to associate to 
#     SongVibe.where(:vibe_id => params[:id]).destroy_all
#     flash[:success] = "vibe deleted"
#     redirect_to new_song_path
#   end

# private

#   def vibe_params
#     params.require(:vibe).permit(:name, :user_id, :song_id)
#   end

end