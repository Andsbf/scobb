class CreatePaycheques < ActiveRecord::Migration
  def change
    create_table :paycheques do |t|
      t.references :employee, index: true, foreign_key: true
      t.decimal :hours
      t.decimal :total
      t.boolean :is_paid
      t.string :payment_method
      t.date :payment_date

      t.timestamps null: false
    end
  end
end
