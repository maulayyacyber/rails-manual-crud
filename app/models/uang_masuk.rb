class UangMasuk < ApplicationRecord

	paginates_per 10

	def self.search(dari_tanggal, sampai_tanggal)
		self.where("tanggal between ? AND ?", "%#{dari_tanggal}%", "%#{sampai_tanggal}%")
	end

end
