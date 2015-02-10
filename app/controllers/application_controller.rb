class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  
 	def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  #creates a helper method so current_user can be used outside controller
  helper_method :current_user

  #authorize method requires current user to be logged in or else redirects to login path
  def authorize
  	redirect_to login_path unless current_user
  end

end
