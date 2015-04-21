class AddPrivelegeToEmployees < ActiveRecord::Migration
  def change
    add_reference :employees, :privelege, index: true
  end
end
