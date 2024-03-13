class DeleteItemIngredient < ActiveRecord::Migration[7.0]
  def change
    drop_table :item_ingredient
  end
end
