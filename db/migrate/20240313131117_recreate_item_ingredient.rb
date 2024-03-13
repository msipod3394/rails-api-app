class RecreateItemIngredient < ActiveRecord::Migration[7.0]
  def change
    create_table :item_ingredient do |t|

      # item と ingredient のリレーション
      t.references :item, null: false, foreign_key: true
      t.references :ingredient, null: false, foreign_key: true

      # 作成日時/更新日時
      t.timestamps
    end
  end
end
