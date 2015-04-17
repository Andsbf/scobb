class AddNotesToDependants < ActiveRecord::Migration
  def change
    add_column :dependants, :notes, :string
  end
end
