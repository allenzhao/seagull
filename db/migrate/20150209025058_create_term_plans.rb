class CreateTermPlans < ActiveRecord::Migration
  def change
    create_table :term_plans do |t|
      t.time :start_time
      t.time :end_time
      t.integer :weekday
      t.integer :lesson
      t.integer :location

      t.timestamps null: false
    end
  end
end
