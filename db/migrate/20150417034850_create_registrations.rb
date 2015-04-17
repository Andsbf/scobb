class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.references :payment, index: true, foreign_key: true
      t.references :client, index: true, foreign_key: true
      t.references :dependant, index: true, foreign_key: true
      t.references :course, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
