class UsersController < ApplicationController

	def new
		if session[:user_id]
			# should redirect_to user's show page instead of root
      		redirect_to '/'
   		else
      		@user = User.new
    	end
	end

	def create
		@user = User.new(user_params)
		if @user.save
	  		session[:user_id] = @user.id
	  	  	redirect_to user_path(@user)
	  	else
	  		redirect_to '/'
	  	end
	end

	def show
		@user = User.find(params[:id])
	end

private

	def user_params
     	params.require(:user).permit(:username, :password, :email)
    end
	
end