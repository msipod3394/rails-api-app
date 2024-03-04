class CreateNetas < ActiveRecord::Migration[7.0]
  def change
    create_table :netas do |t|
      t.string :title  # タイトル
      
      t.timestamps     # 作成日時/更新日時
    end
  end
end
