class CreateMusicalInstruments < ActiveRecord::Migration[5.0]
  def change
    create_table :musical_instruments do |t|
      t.string :name
      t.integer :price
      t.string :material
      t.string :sound_quality
      t.string :felling
      t.string :accessories
      t.string :brand
      t.string :seller

      t.timestamps
    end
  end
end
