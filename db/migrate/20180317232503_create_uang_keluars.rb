class CreateUangKeluars < ActiveRecord::Migration[5.1]
  def change
    create_table :uang_keluars do |t|
      t.string :jumlah
      t.date :tanggal
      t.text :keterangan

      t.timestamps
    end
  end
end
