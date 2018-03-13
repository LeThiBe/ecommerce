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
  end
end
