class ChangeItems < ActiveRecord::Migration[7.0]
  def change
    change_column :items, :name, :string, limit: 255, null: false
    add_index :items, :name, unique: true
  end
end
