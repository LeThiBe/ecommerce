class AddDateToOrderProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :order_products, :date, :datetime
  end
end
