class CreateWeekPlans < ActiveRecord::Migration
  def change
    create_table :week_plans do |t|
      t.datetime :start_checkin_time
      t.datetime :late_checkin_time
      t.datetime :end_checkin_time
      t.datetime :start_checkout_time
      t.datetime :end_checkout_time
      t.integer :weekday
      t.integer :lesson
      t.integer :location

      t.timestamps null: false
    end
  end
end
