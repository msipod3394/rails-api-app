class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :user_name  # ユーザー名
      t.string :email      # メールアドレス
      t.string :password   # パスワード

      t.timestamps         # 作成日時と更新日時
    end
  end
end
