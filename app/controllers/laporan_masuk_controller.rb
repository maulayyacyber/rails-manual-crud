class LaporanMasukController < ApplicationController
  
  def index
  	if user_is_logged_in?
		    @title 			= 'Laporan Uang Masuk'  	
		    @lap_uang_masuk	= true
		    if params[:dari_tanggal] and params[:sampai_tanggal]
	        @data_uang_masuk = search
	      else
	        @data_uang_masuk = nil
	      end
  	else
  		redirect_to '/'
  	end
  end

  def search
  	@data_uang_masuk = UangMasuk.search(params[:dari_tanggal], params[:sampai_tanggal])
  end

end
