class AddStartDateToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :startDate, :date
    add_column :courses, :endDate, :date
  end
end
