class CreatePriveleges < ActiveRecord::Migration
  def change
    create_table :priveleges do |t|
      t.boolean :privileges1
      t.boolean :priveleges2
      t.boolean :priveleges3
      t.boolean :priveleges4

      t.timestamps null: false
    end
  end
end
