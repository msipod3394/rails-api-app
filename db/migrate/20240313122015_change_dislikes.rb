class ChangeDislikes < ActiveRecord::Migration[7.0]
  def change

    # don_id カラム削除
    remove_column :dislikes, :don_id

    # neta_id を ingredient_id に名称変更
    rename_column :dislikes, :neta_id, :ingredient_id

    # ingredient_id user_id のデータ型を bigint に変更
    change_column :dislikes, :ingredient_id, :bigint
    change_column :dislikes, :user_id, :bigint

    # ingredient_id user_id に NOT NULL 制約 を追加
    change_column_null :dislikes, :ingredient_id, false
    change_column_null :dislikes, :user_id, false

    # dislikesテーブルに ingredientsテーブル と usersテーブル への外部キー制約を追加
    add_foreign_key :dislikes, :ingredients
    add_foreign_key :dislikes, :users

  end
end
