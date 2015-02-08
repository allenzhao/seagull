class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.integer :student_number
      t.integer :school
      t.string :grade
      t.string :student_class
      t.string :major
      t.integer :sex
      t.string :phone_number
      t.integer :dyned_class
      t.string :email
      t.timestamps null: false
    end
  end
end
