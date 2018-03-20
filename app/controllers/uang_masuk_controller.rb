class UangMasukController < ApplicationController
  # before_action :set_uang_masuk, only: [:add ,:edit, :update, :destroy]
  def index
	  if user_is_logged_in?
  	  @title            = 'Uang Masuk'
      @uang_masuk       = true
      @data_uang_masuk  = UangMasuk.where(["keterangan iLIKE ?","%#{params[:search]}%"]).order(id: :desc).page(params[:page])
  	else
  		redirect_to '/'
  	end
  end

  def add
	  if user_is_logged_in?
  	  @title       = 'Tambah Uang Masuk'
      @uang_masuk  = true
  	else
  		redirect_to '/'
  	end
  end

  def create
	  if user_is_logged_in?
  	  uang_masuk = UangMasuk.new(add_params)
      if uang_masuk.save
      	flash[:success] = 'Data Berhasil Disimpan'
		    redirect_to '/apps/uang/masuk/'
      else
		    flash[:danger] = 'Data Gagal Disimpan'
		    redirect_to '/apps/uang/masuk/'
      end
  	else
  		redirect_to '/'
  	end
  end

  def edit
    if user_is_logged_in?
      @title       = 'Edit Uang Masuk'
      @uang_masuk  = true
      @data_uang_masuk = UangMasuk.find(params[:id])
    else
      redirect_to '/'
    end
  end

  def update
    if user_is_logged_in?
      @data_uang_masuk = UangMasuk.find(params[:id])
      if @data_uang_masuk.update(add_params)
        flash[:success] = 'Data Berhasil Diupdate'
        redirect_to '/apps/uang/masuk/'
      else
        flash[:danger] = 'Data Gagal Diupdate'
        redirect_to '/apps/uang/masuk/'
      end
    else
      redirect_to '/'
    end
  end

  def delete
    if user_is_logged_in?
      @data_uang_masuk = UangMasuk.find(params[:id])
      if @data_uang_masuk.destroy
        flash[:success] = 'Data Berhasil Dihapus'
        redirect_to '/apps/uang/masuk/'
      end
    else
      redirect_to '/'
    end
  end

  private

    # def set_uang_masuk
    #   @uang_masuk = UangMasuk.find(params[:id])
    # end

  	def add_params
  		params.require(:uang_masuk).permit(:jumlah, :tanggal, :keterangan)
  	end

end
