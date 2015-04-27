class AddDependantsNamesToClients < ActiveRecord::Migration
  def change
    add_column :clients, :dependants_name, :string
  end
end
