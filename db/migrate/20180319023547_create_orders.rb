class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.references :customer, foreign_key: true
      t.references :pay, foreign_key: true
      t.float :amount
      t.boolean :status_pay
      t.boolean :status_ship

      t.timestamps
    end
    add_index :orders, [:user_id, :created_at]
    add_index :orders, [:customer_id, :created_at]
    add_index :orders, [:pay_id, :created_at]
  end
end
