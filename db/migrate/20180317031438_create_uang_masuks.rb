class CreateUangMasuks < ActiveRecord::Migration[5.1]
  def change
    create_table :uang_masuks do |t|
      t.string :jumlah
      t.date :tanggal
      t.text :keterangan

      t.timestamps
    end
  end
end
