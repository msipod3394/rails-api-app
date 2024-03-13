class ChangeOrdersAddRelation < ActiveRecord::Migration[7.0]
  def change

    change_column :orders, :user_id, :bigint
    change_column_null :orders, :user_id, false
    add_foreign_key :orders, :users

  end
end
