class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.references :product, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :star
      t.string :content

      t.timestamps
    end
  end
end
