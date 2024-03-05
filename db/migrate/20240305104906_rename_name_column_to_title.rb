class RenameNameColumnToTitle < ActiveRecord::Migration[7.0]
  def change
    rename_column :dons, :name, :title
  end
end
