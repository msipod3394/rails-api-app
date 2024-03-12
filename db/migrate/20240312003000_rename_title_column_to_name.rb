class RenameTitleColumnToName < ActiveRecord::Migration[7.0]
  def change
    rename_column :dons, :title, :name
  end
end
