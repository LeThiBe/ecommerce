class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.string :url_picture
      t.references :product, foreign_key: true

      t.timestamps
    end
    add_index :pictures, [:product_id, :created_at]
  end
end
