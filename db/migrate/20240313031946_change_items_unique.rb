class ChangeItemsUnique < ActiveRecord::Migration[7.0]
  def change
    # 一意性制約のバリデーション
    add_index :items, :name, unique: true
  end
end
