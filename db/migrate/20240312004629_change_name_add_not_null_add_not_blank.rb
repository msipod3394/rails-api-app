class ChangeNameAddNotNullAddNotBlank < ActiveRecord::Migration[7.0]
  def change
      # donsテーブル name に not null制約
      change_column :dons, :name, :string, null: false, default: ""
  end
end
