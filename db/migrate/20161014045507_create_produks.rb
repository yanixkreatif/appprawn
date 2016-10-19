class CreateProduks < ActiveRecord::Migration
  def change
    create_table :produks do |t|
      t.string :nama
      t.integer :stok

      t.timestamps null: false
    end
  end
end
