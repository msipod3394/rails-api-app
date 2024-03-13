class CreateIngredientItems < ActiveRecord::Migration[7.0]
  def change
    create_table :ingredient_items do |t|
      t.references :ingredient, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
