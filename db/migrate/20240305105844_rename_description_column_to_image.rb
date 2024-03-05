class RenameDescriptionColumnToImage < ActiveRecord::Migration[7.0]
  def change
    rename_column :dons, :description, :image
  end
end
