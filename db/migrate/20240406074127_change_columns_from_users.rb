class ChangeColumnsFromUsers < ActiveRecord::Migration[7.0]
  def change
    change_table :users do |t|
      t.change :user_name, :string, null: false, unique: false
    end
  end
end
