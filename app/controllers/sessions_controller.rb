class SessionsController < ApplicationController

	def new
		@user = User.new
	end

	def create
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

private

	def session_params
    	params.require(:user).permit(:username, :email, :password)
  	end

end