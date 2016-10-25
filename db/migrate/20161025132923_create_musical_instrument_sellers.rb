class CreateMusicalInstrumentSellers < ActiveRecord::Migration[5.0]
  def change
    create_table :musical_instrument_sellers do |t|
      t.references :musical_instrument, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
