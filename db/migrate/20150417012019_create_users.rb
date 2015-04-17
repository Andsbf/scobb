class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :phone_alternate
      t.date :birthday
      t.string :gender
      t.string :address
      t.text :notes

      t.timestamps null: false
    end
  end
end
