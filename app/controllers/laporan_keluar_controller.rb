class LaporanKeluarController < ApplicationController
  
  def index
  	if user_is_logged_in?
		@title 			= 'Laporan Uang Keluar'  	
		@lap_uang_keluar= true
		if params[:dari_tanggal] and params[:sampai_tanggal]
	        @data_uang_keluar = search
	      else
	        @data_uang_keluar = nil
	      end
  	else
  		redirect_to '/'
  	end  	
  end

  def search
  	@data_uang_keluar = UangKeluar.search(params[:dari_tanggal], params[:sampai_tanggal])
  end

end
