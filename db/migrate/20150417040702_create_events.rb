class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :employee, index: true, foreign_key: true
      t.references :course, index: true, foreign_key: true
      t.datetime :start_time
      t.decimal :duration

      t.timestamps null: false
    end
  end
end
