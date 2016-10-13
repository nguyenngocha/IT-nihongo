class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.integer :old
      t.integer :gender
      t.string :address
      t.string :contact

      t.timestamps
    end
  end
end
