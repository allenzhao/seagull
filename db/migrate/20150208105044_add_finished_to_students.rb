class AddFinishedToStudents < ActiveRecord::Migration
  def change
    add_column :students, :finished, :boolean
  end
end
