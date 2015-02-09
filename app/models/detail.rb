class Detail < ActiveRecord::Base
  belongs_to :student
  belongs_to :class_room
end
