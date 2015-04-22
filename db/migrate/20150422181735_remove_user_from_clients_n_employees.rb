class RemoveUserFromClientsNEmployees < ActiveRecord::Migration
  def change
    remove_column :clients, :user_id, :integer
    remove_column :employees, :user_id, :integer
  end
end
