class HomeController < ApplicationController

  def index
  	@title = 'Masuk Aplikasi'
  	if user_is_logged_in?
  		redirect_to '/apps/dashboard'
  	end
  end

  def create_session
    user = User.find_by(username:login_params[:username]) 
    # verify recaptcha
    if verify_recaptcha(model: @user, :message=> "Pastikan Anda bukan robot!")
      #check user sign in
      if user && user.authenticate(login_params[:password])
        session[:user_id] = user.id
        redirect_to '/apps/dashboard/'
      else
        flash[:danger] = 'Username atau Password Anda salah.'
        redirect_to '/' 
      end

    else
        #flash[:danger] = 'Recaptcha Salah.'
        redirect_to '/' 
    end
      
  end

  private
    def login_params
      params.require(:login).permit(:username, :password)
    end

end
