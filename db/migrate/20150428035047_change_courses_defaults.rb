class ChangeCoursesDefaults < ActiveRecord::Migration
  def change
    change_column_default :courses, :num_students, 0
    change_column_default :courses, :is_full, false
    change_column_default :courses, :description, ""
    change_column_default :courses, :level, "0"
  end
end
