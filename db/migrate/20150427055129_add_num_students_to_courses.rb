class AddNumStudentsToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :num_students, :integer
  end
end
