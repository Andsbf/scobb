class ChangeAddressType < ActiveRecord::Migration
  def change
    change_column :clients, :address,  :text
    change_column :employees, :address,  :text
  end
end
