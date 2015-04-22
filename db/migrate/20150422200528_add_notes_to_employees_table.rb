class AddNotesToEmployeesTable < ActiveRecord::Migration
  def change
    add_column :employees, :notes, :text
  end
end
