class AddIsFullToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :is_full, :boolean
  end
end
