class DashboardController < ApplicationController

  def index
  	if user_is_logged_in?
  		@title      = 'Dashboard'
      @dashboard  = true
      @data_uang_masuk = UangMasuk.where("tanggal > ? AND tanggal < ?", Time.now.beginning_of_month, Time.now.end_of_month)
      @data_uang_keluar_bulan_ini = UangKeluar.where("tanggal > ? AND tanggal < ?", Time.now.beginning_of_month, Time.now.end_of_month)
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
