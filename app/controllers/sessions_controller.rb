class SessionsController < ApplicationController

	def new
	end

	# creates a session for current user by finding User id
	def create
		user = User.find_by(email: params[:user][:email])
	
			if user && user.authenticate(params[:user][:password])
				session[:user_id] = user.id.to_s
				redirect_to user_workouts_path(user)
			else
				render :new
			end
	end

	# method logs user out of session
	def destroy
		session[:user_id] = nil
		redirect_to '/login'
	end

end