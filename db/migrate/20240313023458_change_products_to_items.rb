class ChangeProductsToItems < ActiveRecord::Migration[7.0]
  def change
    rename_table :products, :items
  end
end
