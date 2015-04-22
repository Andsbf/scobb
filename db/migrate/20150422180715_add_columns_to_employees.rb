class AddColumnsToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :first_name, :string
    add_column :employees, :last_name, :string
    add_column :employees, :email, :string
    add_column :employees, :phone, :string
    add_column :employees, :phone_alternate, :string
    add_column :employees, :birthday, :datetime
    add_column :employees, :gender, :string
    add_column :employees, :address, :string
    add_column :employees, :password_digest, :string
    
  end
end
