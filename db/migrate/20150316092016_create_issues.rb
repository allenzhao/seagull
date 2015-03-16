class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :title
      t.text :description
      t.references :user, index: true
      t.references :student, index: true
      t.integer :status

      t.timestamps null: false
    end
    add_foreign_key :issues, :users
    add_foreign_key :issues, :students
  end
end
