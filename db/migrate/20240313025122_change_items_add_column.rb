class ChangeItemsAddColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :image, :string, limit: 255, null: false
  end
end
