class ChangeOrders < ActiveRecord::Migration[7.0]
  def change
    # rename_column :orders, :don_id, :item_id
    change_column :orders, :item_id, :bigint
    change_column_null :orders, :item_id, false
    add_foreign_key :orders, :items
  end
end
