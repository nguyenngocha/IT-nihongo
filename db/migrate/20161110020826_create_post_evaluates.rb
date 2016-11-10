class CreatePostEvaluates < ActiveRecord::Migration[5.0]
  def change
    create_table :post_evaluates do |t|
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true
      t.integer :evaluation

      t.timestamps
    end
  end
end
