class ChangeIngredients < ActiveRecord::Migration[7.0]
  def change
    # ingredientsテーブル name に not null 制約 を追加
    change_column :ingredients, :name, :string, null: false
  end
end
