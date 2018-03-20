class UangKeluarController < ApplicationController
# before_action :set_uang_masuk, only: [:add ,:edit, :update, :destroy]
  def index
	  if user_is_logged_in?
  	  @title            = 'Uang Keluar'
      @uang_keluar       = true
      @data_uang_keluar  = UangKeluar.where(["keterangan iLIKE ?","%#{params[:search]}%"]).order(id: :desc).page(params[:page])
  	else
  		redirect_to '/'
  	end
  end

  def add
	if user_is_logged_in?
  	  @title       = 'Tambah Uang Keluar'
      @uang_keluar  = true
  	else
  	  redirect_to '/'
  	end
  end

  def create
	  if user_is_logged_in?
  	  uang_keluar = UangKeluar.new(add_params)
      if uang_keluar.save
      	flash[:success] = 'Data Berhasil Disimpan'
		redirect_to '/apps/uang/keluar/'
      else
		flash[:danger] = 'Data Gagal Disimpan'
		redirect_to '/apps/uang/keluar/'
      end
  	else
  		redirect_to '/'
  	end
  end

  def edit
    if user_is_logged_in?
      @title       = 'Edit Uang Keluar'
      @uang_keluar  = true
      @data_uang_keluar = UangKeluar.find(params[:id])
    else
      redirect_to '/'
    end
  end

  def update
    if user_is_logged_in?
      @data_uang_keluar = UangKeluar.find(params[:id])
      if @data_uang_keluar.update(add_params)
        flash[:success] = 'Data Berhasil Diupdate'
        redirect_to '/apps/uang/keluar/'
      else
        flash[:danger] = 'Data Gagal Diupdate'
        redirect_to '/apps/uang/keluar/'
      end
    else
      redirect_to '/'
    end
  end

  def delete
    if user_is_logged_in?
      @data_uang_keluar = UangKeluar.find(params[:id])
      if @data_uang_keluar.destroy
        flash[:success] = 'Data Berhasil Dihapus'
        redirect_to '/apps/uang/keluar/'
      end
    else
      redirect_to '/'
    end
  end

  private

  	def add_params
  		params.require(:uang_keluar).permit(:jumlah, :tanggal, :keterangan)
  	end
end
