class RemoveCourseIdFromPayments < ActiveRecord::Migration
  def change
    remove_column :payments, :course_id, :integer
    remove_column :payments, :client_id, :integer
  end
end
