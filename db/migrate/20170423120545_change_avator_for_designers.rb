class ChangeAvatorForDesigners < ActiveRecord::Migration[5.0]
  def change
    rename_column :designers, :avator, :avatar
  end
end
