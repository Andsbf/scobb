class CreateDependants < ActiveRecord::Migration
  def change
    create_table :dependants do |t|
      t.references :client, index: true, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.date :birthday
      t.string :gender

      t.timestamps null: false
    end
  end
end
