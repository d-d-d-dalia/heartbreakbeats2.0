class SessionsController < ApplicationController

	def new
		@user = User.new
	end

	def create
		# find the user by the username that was submitted by the form
		@user = User.find_by(:username => params[:user][:username])
  		if @user && @user.authenticate(params[:user][:password])
		    session[:user_id] = @user.id
       		redirect_to user_path(@user)
      	else
      		flash[:error] = "Invalid username or password"
       		redirect_to '/signin'
      	end
	end

	def destroy
		session[:user_id] = nil
		redirect_to '/'
	end

	def oauth
		# binding.pry
    	@user = User.find_or_create_by_omniauth(auth)
    	session[:user_id] = @user.id
    	redirect_to user_path(@user)
  	end

private

# DO I NEED THIS?
	def auth
    	request.env['omniauth.auth']
  	end

	def session_params
    	params.require(:user).permit(:username, :email, :password)
  	end

end