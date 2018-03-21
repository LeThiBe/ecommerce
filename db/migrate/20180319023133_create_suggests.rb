class CreateSuggests < ActiveRecord::Migration[5.1]
  def change
    create_table :suggests do |t|
      t.references :user, foreign_key: true
      t.integer :status
      t.string :name
      t.float :price
      t.string :picture
      t.string :description

      t.timestamps
    end
    add_index :suggests, [:user_id, :created_at]
  end
end
