class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.boolean :is_paid
      t.date :date
      t.decimal :total

      t.timestamps null: false
    end
  end
end
