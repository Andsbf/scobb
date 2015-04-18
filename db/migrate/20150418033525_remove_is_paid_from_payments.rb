class RemoveIsPaidFromPayments < ActiveRecord::Migration
  def change
    remove_column :payments, :is_paid, :boolean
  end
end
