class CreateAdmins < ActiveRecord::Migration[5.0]
  def change
    create_table :admins do |t|
      t.string :name
      t.string :nick_name
      t.string :password_digest
      t.string :email

      t.timestamps
    end
  end
end
