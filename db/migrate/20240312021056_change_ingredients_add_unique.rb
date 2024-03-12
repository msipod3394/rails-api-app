class ChangeIngredientsAddUnique < ActiveRecord::Migration[7.0]
  def change
      # 一意性制約のバリデーション
      add_index :ingredients, :name, unique: true
  end
end
