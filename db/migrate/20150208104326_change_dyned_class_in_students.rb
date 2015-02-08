class ChangeDynedClassInStudents < ActiveRecord::Migration
  def change
    change_column :students, :dyned_class, :string
  end
end
