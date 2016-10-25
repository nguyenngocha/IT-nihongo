class CreateMusicalInstrumentImages < ActiveRecord::Migration[5.0]
  def change
    create_table :musical_instrument_images do |t|
      t.references :musical_instrument, foreign_key: true

      t.timestamps
    end
  end
end
