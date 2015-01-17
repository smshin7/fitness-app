class WorkoutsController < ApplicationController
	before_action :authorize

	def index
		@user = User.find(params[:user_id])
		@workouts = Workout.all
	end

	def new
		@user = User.find(params[:user_id])
		@workout = Workout.new
	end

	def create
		@user = User.find(params[:user_id])
		@workout = Workout.new(params.require(:workout).permit(:type, :distance, :time))
		@user.workout.push(@workouts)
		
		if @user.save
			redirect_to user_path(@workouts.user)
		else
			render :new
		end
	end

	def edit
		# @user = User.find(params[:user_id])
		# @workout = @user.workout.find_by(params.[:id])
	end

	def update
		@user = User.find(params[:user_id])
		if @user.workout.find(params[:id]).update_attributes(params.require(:workout).permit(:type, :distance, :time))
			redirect_to user_path(@user)
		else
			render :new
		end
	end

	def destroy
		@user = User.find(params[:user_id])
		@user.workout.find(params[:id].destroy)
		redirect_to user_path(@user)
	end

end