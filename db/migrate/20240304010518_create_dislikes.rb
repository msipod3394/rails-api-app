class CreateDislikes < ActiveRecord::Migration[7.0]
  def change
    create_table :dislikes do |t|
      t.integer :don_id   # 丼ID
      t.integer :neta_id  # ネタID
      t.string :user_id   # ユーザーID

      t.timestamps
    end
  end
end
