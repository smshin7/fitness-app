class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(params.require(:user).permit(:first_name, :last_name, :age, :gender, :email, :height, :weight, :location, :gym, :goal, :password, :password_confirmation))
	
		if @user.save
			redirect_to users_path
		else
			render :new
		end
	end

	def edit
		@user = User.find_by(params[:user_id])
	end

	def update
		@user = User.find_by(params[:user_id])
		if @user.update_attributes(params.require(:user).permit(:first_name, :last_name, :age, :gender, :email, :height, :weight, :location, :gym, :goal))
			redirect_to users_path
		else
			render :edit
		end
	end

	def destroy
		@user = User.find_by(params[:user_id])
		@user.destroy
		redirect_to user_path(@user)
	end

end