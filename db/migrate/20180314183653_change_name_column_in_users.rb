class ChangeNameColumnInUsers < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :status, :activated
  end
end
