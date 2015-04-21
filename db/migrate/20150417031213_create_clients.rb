class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.references :user

      t.timestamps null: false
    end
  end
end
