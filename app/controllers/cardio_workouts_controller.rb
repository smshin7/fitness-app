class CardioWorkoutsController < ApplicationController
	before_action :authorize

	def index
		@cardio_workouts = CardioWorkout.all
	end

	def new
		@user = User.find(params[:user_id])
		@cardio_workout = CardioWorkout.new()
	end

	def create
		@user = User.find(params[:user_id])
		@cardio_workout = CardioWorkout.new(params.require(:cardio_workout).permit(:type, :distance, :time))
		@user.cardio_workouts.push(@cardio_workout)
		
		if @user.save
			redirect_to user_path(@cardio_workout.user)
		else
			render :new
		end
	end

	def edit
		@user = User.find(params[:user_id])
		@cardio_workout = @user.cardio_workouts.find(params.[:id])
	end

	def update
		@user = User.find(params[:user_id])
		if @user.cardio_workouts.find(params[:id]).update_attributes(params.require(:cardio_workout).permit(:type, :distance, :time))
			redirect_to user_path(@user)
		else
			render :new
		end
	end

	def destroy
		@user = User.find(params[:user_id])
		@user.cardio_workouts.find(params[:id].destroy)
		redirect_to user_path(@user)
	end

end