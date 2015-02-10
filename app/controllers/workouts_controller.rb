class WorkoutsController < ApplicationController
	before_action :authorize
	before_action :get_user # only: [:index, :new, :create]


	# action that displays all workouts for the current user logged in
	def index
		@workouts = Workout.where(user: @user).all.order(created_at: :desc)
	end

	# action that shows a specific workout for the current user
	def show
		@workout = @user.workouts.find(params[:id])
	end

	def new
		@workout = Workout.new
	end

	# action to create a workout for current user logged in
	def create
		@workout = @user.workouts.create(workout_params)
		
		if @user.save
			flash[:info] = "New Workout Logged!"
			redirect_to user_workouts_path
		else
			flash.now[:danger] = @workout.errors.full_messages.to_sentence
			render :new
		end
	end

	def edit
		@workout = @user.workouts.find(params[:id])
	end

	# action to edit workout for current user
	def update
		@workout = @user.workouts.find(params[:id])
		if @workout.update_attributes(workout_params)
			flash.now[:success] = "Workout edit successful"
			redirect_to user_workouts_path
		else
			render :edit
		end
	end

	# action to delete workouts for user 
	def destroy
		@workout = @user.workouts.find(params[:id])
		@workout.destroy
		flash.now[:danger] = "Workout Deleted!"
		redirect_to user_workouts_path
	end

	# defining user to be used within workouts controller
	def get_user
		@user = User.find(params[:user_id])
	end

private

	# strong params for workouts model to be used within controller
	def workout_params
		params.require(:workout).permit!
	end

end