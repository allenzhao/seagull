class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.references :student
      t.integer :weekday
      t.integer :lesson
      t.integer :location

      t.timestamps null: false
    end
  end
end
