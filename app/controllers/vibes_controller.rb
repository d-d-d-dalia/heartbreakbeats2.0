class VibesController < ApplicationController

	def new
   	@review = Review.new
  end

  def create
    @song = Song.find(params[:song_id])
  	@vibe = @song.vibes.build(vibe_params)
	end

	def edit
   	@user = User.find(params[:user_id])
   	@vibe = Vibe.find(params[:id])
  	@song = @vibe.song
	end

  def update
   	@vibe = Vibe.find(params[:id])
    	if @vibe.update(vibe_params)
      	flash[:success] = "Vibes Updated"
      	redirect_to user_path(current_user)
    	else
      	render :edit
   		end
 	end

  def destroy
    @vibe = current_user.vibes.find(params[:id])
   	@vibe.destroy
    flash[:success] = "Vibe deleted"
    redirect_to user_path(current_user)
  end

private

  def vibe_params
    params.require(:vibe).permit(:name, :user_id, :song_id)
  end

end