class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.references :musical_instrument, foreign_key: true
      t.string :content
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
