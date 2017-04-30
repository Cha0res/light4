class ChangeAvatorForUsers < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :avator, :avatar
  end
end
