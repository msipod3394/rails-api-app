class ChangeColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    # devise jwt 設定
    add_column :users, :jti, :string, null: false
    add_index :users, :jti, unique: true
  end
end
