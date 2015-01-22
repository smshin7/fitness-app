class WorkoutsController < ApplicationController
	before_action :authorize
	before_action :get_user

	def index
		@workouts = Workout.where(user: @user).all
	end

	def new
		@workout = Workout.new
	end

	def create
		@workout = @user.workouts.create(workout_params)
		
		if @user.save
			redirect_to user_workouts_path
		else
			render :new
		end
	end

	def edit
		@workout = @user.workout.find_by(params[:id])
	end

	def update
		# @user = User.find(params[:user_id])
		if @user.workout.find(params[:id]).update_attributes(workout_params)
			redirect_to user_path(@user)
		else
			render :new
		end
	end

	def destroy
		@user.workout.find(params[:id].destroy)
		redirect_to user_path(@user)
	end

	def get_user
		@user = User.find(params[:user_id])
	end

	private

	def workout_params
		params.require(:workout).permit!
	end

end