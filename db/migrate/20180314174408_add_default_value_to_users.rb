class AddDefaultValueToUsers < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :status, :boolean, default: false
    change_column :users, :is_admin, :boolean, default: false
    change_column :users, :point, :integer, default: 0
  end
end
