class CreateOrderDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :order_details do |t|
      t.float :price
      t.integer :quantity
      t.references :order_product, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
