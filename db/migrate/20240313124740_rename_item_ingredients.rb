class RenameItemIngredients < ActiveRecord::Migration[7.0]
  def change
    # テーブル名を変更
    rename_table :item_ingredients, :item_ingredient
  end
end
