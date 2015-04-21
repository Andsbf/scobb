class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :employee, index: true
      t.references :course, index: true
      t.datetime :start_time
      t.decimal :duration

      t.timestamps null: false
    end
  end
end
