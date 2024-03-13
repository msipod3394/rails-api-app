class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      # 商品名
      t.string :name, limit: 255, unique: true, null: false

      # 画像
      t.string :image, limit: 255, null: false

      # 作成日時/更新日時
      t.timestamps
    end
  end
end
