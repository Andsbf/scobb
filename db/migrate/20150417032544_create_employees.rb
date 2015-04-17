class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :certification
      t.decimal :hourly_rate
      t.references :user

      t.timestamps null: false
    end
  end
end
