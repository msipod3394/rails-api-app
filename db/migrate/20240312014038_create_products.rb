class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name, null: false   # 丼名
      t.string :image, null: false  # 画像

      t.timestamps     # 作成日時/更新日時
    end
    # 一意性制約のバリデーション
    add_index :products, :name, unique: true
  end
end
