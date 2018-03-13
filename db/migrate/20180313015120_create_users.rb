class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.boolean :status
      t.string :phone
      t.string :address
      t.string :avatar
      t.integer :point
      t.boolean :is_admin

      t.timestamps
    end
  end
end
