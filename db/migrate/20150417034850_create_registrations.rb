class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.references :payment, index: true 
      t.references :client, index: true 
      t.references :dependant, index: true 
      t.references :course, index: true 

      t.timestamps null: false
    end
  end
end
