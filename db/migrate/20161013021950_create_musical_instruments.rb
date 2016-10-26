class CreateMusicalInstruments < ActiveRecord::Migration[5.0]
  def change
    create_table :musical_instruments do |t|
      t.string :name
      t.integer :price
      t.string :material
      t.string :brand

      t.timestamps
    end
  end
end
