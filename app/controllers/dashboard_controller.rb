class DashboardController < ApplicationController

  def index
  	if user_is_logged_in?
  		@title      = 'Dashboard'
      @dashboard  = true
  	else
  		redirect_to '/'
  	end
  end

  def destroy
  	if user_is_logged_in?
  		session[:user_id] = nil
  		flash[:success]   = 'Anda berhasil keluar.'
  		redirect_to '/'
  	end
  end

end
