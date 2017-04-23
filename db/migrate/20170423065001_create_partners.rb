class CreatePartners < ActiveRecord::Migration[5.0]
  def change
    create_table :partners do |t|
      t.string :name
      t.string :logo
      t.string :official_site

      t.timestamps
    end
  end
end
