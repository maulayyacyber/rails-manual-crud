class RegisterController < ApplicationController
  
  def index
  	@title = 'Users'
  	#if user_is_logged_in?
  		@users       = true
      @data_users  = User.where(["name iLIKE ?","%#{params[:search]}%"]).order(:id).page(params[:page])
  	#else
  		#redirect_to '/'
  	#end
  end

  def add
    #if user_is_logged_in?
      @title = 'Tambah User'
      @users       = true
    #else
      #redirect_to '/'
    #end
  end

  def create
    #if user_is_logged_in?
      user = User.new(user_params)
      if user.save
      	flash[:success] = 'Data Berhasil Disimpan'
		    redirect_to '/apps/users/'
      else
		    flash[:danger] = 'Data Gagal Disimpan'
		    redirect_to '/apps/users/'
      end
    #else
      #redirect_to '/'
    #end
  end

  def edit
    if user_is_logged_in?
      @user         = User.find(params[:id])
      @title        = 'Edit User'
      @users        = true
    else
      redirect_to '/'
    end
  end

  def update
    if user_is_logged_in?
      @user = User.find(params[:id])
      if @user.update(user_params)
          flash[:success] = 'Data Berhasil Diupdate'
          redirect_to '/apps/users/'
      else
          flash[:danger] = 'Data Gagal Diupdate'
          redirect_to '/apps/users/'
      end
    else
      redirect_to '/'
    end
  end

  def delete
    if user_is_logged_in?
      @user = User.find(params[:id])
      if @user.destroy
        flash[:success] = 'Data Berhasil Dihapus'
        redirect_to '/apps/users/'
      end
    else
      redirect_to '/'
    end
  end

  private
  	def user_params
      params.require(:user).permit(:name, :username, :password, :password_confirmation)
    end

end
