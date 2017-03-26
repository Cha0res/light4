class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :nick_name
      t.string :email
      t.string :password_digest
      t.string :avator
      t.string :mobile

      t.timestamps
    end
  end
end
