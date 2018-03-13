class CreatePays < ActiveRecord::Migration[5.1]
  def change
    create_table :pays do |t|
      t.string :name

      t.timestamps
    end
  end
end
