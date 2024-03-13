class ChangeFavorites < ActiveRecord::Migration[7.0]
  def change

    # don_idカラムをitem_idにリネーム
    rename_column :favorites, :don_id, :item_id

    # item_id user_id カラムのデータ型を bigint に変更
    change_column :favorites, :item_id, :bigint
    change_column :favorites, :user_id, :bigint

    # item_id user_id カラムに NOT NULL 制約 を追加
    change_column_null :favorites, :item_id, false
    change_column_null :favorites, :user_id, false

    # favoritesテーブルに itemsテーブル と usersテーブル への外部キー制約を追加
    add_foreign_key :favorites, :items
    add_foreign_key :favorites, :users

  end
end
