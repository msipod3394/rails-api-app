class ChangeUsers < ActiveRecord::Migration[7.0]
  def change
    # usersテーブル not null 制約を追加
    # user_name
    change_column :users, :user_name, :string, null: false
    # email
    change_column :users, :email, :string, null: false
    # password
    change_column :users, :password, :string, null: false

    # 一意性制約のバリデーション
    add_index :users, :user_name, unique: true
    add_index :users, :email, unique: true
  end
end
