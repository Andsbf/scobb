class AddPrivelegeToEmployees < ActiveRecord::Migration
  def change
    add_reference :employees, :privelege, index: true, foreign_key: true
  end
end
