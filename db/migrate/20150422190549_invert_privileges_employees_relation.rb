class InvertPrivilegesEmployeesRelation < ActiveRecord::Migration
  def change
    add_reference :privileges, :employee, index: true
    remove_column :employees, :privelege_id, :integer
  end
end
