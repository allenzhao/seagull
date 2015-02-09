class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
      t.references :student, index: true
      t.references :class_room, index: true
      t.datetime :check_in_time
      t.datetime :check_out_time
      t.datetime :change_time
      t.datetime :checkout_time
      t.datetime :keep_time
      t.integer :sign_in_status
      t.integer :action
      t.integer :state
      t.string :message

      t.timestamps null: false
    end
    add_foreign_key :details, :students
    add_foreign_key :details, :class_rooms
  end
end
