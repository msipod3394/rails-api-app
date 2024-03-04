class CreateDons < ActiveRecord::Migration[7.0]
  def change
    create_table :dons do |t|
      t.string :title  # タイトル
      t.string :image  # 画像
      
      t.timestamps     # 作成日時/更新日時
    end
  end
end
