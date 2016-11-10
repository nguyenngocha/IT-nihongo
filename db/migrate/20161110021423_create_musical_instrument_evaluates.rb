class CreateMusicalInstrumentEvaluates < ActiveRecord::Migration[5.0]
  def change
    create_table :musical_instrument_evaluates do |t|
      t.references :post, foreign_key: true
      t.integer :evaluation

      t.timestamps
    end
  end
end
