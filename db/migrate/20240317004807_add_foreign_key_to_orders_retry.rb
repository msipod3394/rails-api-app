class AddForeignKeyToOrdersRetry < ActiveRecord::Migration[7.0]
  def change

    # 既存の外部キー制約を削除
    # remove_foreign_key :orders, :users

    # 新しい外部キー制約を追加（オプション変更）
    # add_foreign_key :orders, :users, on_delete: :cascade

  end
end
