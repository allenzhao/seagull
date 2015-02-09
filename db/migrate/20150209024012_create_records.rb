class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.references :student, index: true
      t.integer :required_times
      t.integer :real_times
      t.integer :leave_times
      t.integer :error_times
      t.integer :total_time

      t.timestamps null: false
    end
    add_foreign_key :records, :students
  end
end
