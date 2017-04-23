class CreateDesigners < ActiveRecord::Migration[5.0]
  def change
    create_table :designers do |t|
      t.string :name
      t.string :email
      t.string :avator
      t.text :info

      t.timestamps
    end
  end
end
