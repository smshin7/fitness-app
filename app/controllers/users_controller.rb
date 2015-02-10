class UsersController < ApplicationController
	before_action :authorize, except: [:new, :create]

	# index grabs all the users in the data base
	def index
		@users = User.where(user: @user).all
	end

	# shows a single user based on id
	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	# creates new user using the sign up form
	def create
		@user = User.new(user_params)
	
		if @user.save
			flash.now[:info] = "New User Created"
			redirect_to @user
		else
			flash.now[:danger] = @user.errors.full_messages.to_sentence
			render :new
		end
	end

	def edit
		get_user
	end

	# updates the user information based on edit form
	def update
			@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to @user
		else
			render :edit
		end
	end

	# deletes user from database after finding by id
	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to @user
	end

	# method to find user by id and call in the users controller
	def get_user
		@user = User.find(params[:id])
	end

	private

	# setting user params privately to use in the users controller
	def user_params
		params.require(:user).permit(:first_name, :last_name, :age, :gender, :email, :height, :weight, :location, :profile_pic, :goal, :password, :password_confirmation)
	end

end