class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :star
      t.string :conten
      t.references :product, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :reviews, [:product_id, :created_at]
    add_index :reviews, [:user_id, :created_at]
  end
end
