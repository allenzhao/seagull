class CreateClassRooms < ActiveRecord::Migration
  def change
    create_table :class_rooms do |t|
      t.string :IP
      t.string :room_name
      t.string :computer_name
      t.string :location

      t.timestamps null: false
    end
  end
end
