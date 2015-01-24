class CardiosController < ApplicationController
	before_action :authorize
	before_action :get_user
	before_action :get_workout

	def index
		@cardios = Cardio.where(:user @user, :workout @workout).all
	end

	def show
		@cardio = Cardio.find(params[:id])
	end

	def new
	end

	def create
	end

	def get_user
		@user = User.find(params[:user_id])
	end

	def get_workout
		@workout = Workout.find(params[:workout_id])
	end

	private

	def cardio_params
		params.require(:cardio).permit!
	end

end