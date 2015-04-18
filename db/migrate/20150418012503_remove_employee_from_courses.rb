class RemoveEmployeeFromCourses < ActiveRecord::Migration
  def change
    remove_column :courses, :employee_id, :integer
  end
end
