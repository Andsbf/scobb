class RenamePrivelegesPrivileges < ActiveRecord::Migration
  def change
    rename_table :priveleges, :privileges
  end
end
