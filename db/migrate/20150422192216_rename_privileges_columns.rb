class RenamePrivilegesColumns < ActiveRecord::Migration
  def change
    rename_column :privileges, :priveleges2, :privileges2
    rename_column :privileges, :priveleges3, :privileges3
    rename_column :privileges, :priveleges4, :privileges4
  end
end
