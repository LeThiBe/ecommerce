class AddPayMethodToOrderProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :order_products, :pay_method, :string
  end
end
