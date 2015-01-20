class CardiosController < ApplicationController

	def index
		@user = User.find(params[:user_id])
		@workout = Workout.find(params[:id])
		@cardios = Cardio.all
	end

	def new
		@user = User.find(params[:user_id])
		@workout = Workout.find(params[:id])
		@cardio = Cardio.new
	end

	# def show
	# 	@user = User.find(params[:user_id])
	# 	@workout = Workout.find(params[:id])

	# end

	def edit
		@user = User.find(params[:user_id])
		@workout = Workout.find(params[:id])
	end

	def update
		@user = User.find(params[:user_id])
		@workout = Workout.find(params[:id])
	end

	def destroy
		@user = User.find(params[:user_id])
		@workout = Workout.find(params[:id])
		@user.workout.cardio.destroy
	end

end