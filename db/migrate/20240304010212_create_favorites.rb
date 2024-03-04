class CreateFavorites < ActiveRecord::Migration[7.0]
  def change
    create_table :favorites do |t|
      t.integer :don_id   # 丼ID
      t.string :user_id   # ユーザーID

      t.timestamps       # 作成日時と更新日時
    end
  end
end
