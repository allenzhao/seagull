class Student < ActiveRecord::Base
  enum school: [:sim, :others]
  validates :student_number, uniqueness: {message: '不允许重复'}

end
