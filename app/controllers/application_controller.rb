class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # check session
  def user_is_logged_in?
  	!!session[:user_id]
  end

   helper_method :user_is_logged_in?

end
