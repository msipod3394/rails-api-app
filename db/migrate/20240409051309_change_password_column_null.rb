class ChangePasswordColumnNull < ActiveRecord::Migration[7.0]
  def up
    change_column_null :users, :password, true
  end

  def down
    change_column_null :users, :password, false
  end
end
