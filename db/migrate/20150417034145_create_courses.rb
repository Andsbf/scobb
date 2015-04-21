class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.references :employee, index: true 
      t.references :category, index: true 
      t.string :name
      t.integer :capacity
      t.decimal :session_cost

      t.timestamps null: false
    end
  end
end
