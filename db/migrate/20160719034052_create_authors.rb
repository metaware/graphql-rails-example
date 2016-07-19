class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :avatar
      t.string :phone_number
      t.string :city
      t.string :state
      t.string :country
      t.timestamps null: false
    end
  end
end
