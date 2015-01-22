class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(params.require(:user).permit(:first_name, :last_name, :age, :gender, :email, :location, :goal, :password, :password_confirmation))
	
		if @user.save
			redirect_to @user
		else
			render :new
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
			@user = User.find(params[:id])
		if @user.update(params.require(:user).permit(:first_name, :last_name, :age, :gender, :email, :height, :weight, :location, :gym, :goal))
			redirect_to @user
		else
			render :edit
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to @user
	end

end