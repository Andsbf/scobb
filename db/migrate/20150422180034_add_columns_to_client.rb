class AddColumnsToClient < ActiveRecord::Migration
  def change
    add_column :clients, :first_name, :string
    add_column :clients, :last_name, :string
    add_column :clients, :email, :string
    add_column :clients, :phone, :string
    add_column :clients, :phone_alternate, :string
    add_column :clients, :birthday, :datetime
    add_column :clients, :gender, :string
    add_column :clients, :address, :string
    add_column :clients, :password_digest, :string
    
  end

end
