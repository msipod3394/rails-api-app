class ChangeNameAddNotNull < ActiveRecord::Migration[7.0]
  def change
    # donsテーブル name に not null制約追加
    change_column_null :dons, :name, false
  end
end
