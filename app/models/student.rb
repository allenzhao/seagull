class Student < ActiveRecord::Base
  includes Exportable
  enum school: [:site, :bs, :sfs, :sim, :sir, :spa, :scll, :sie, :sis, :ss, :sbf, :law]
  enum sex: [:male, :female]
  # %w{经贸,商学,外语,信息,国关,公管,中文,保险,英语,统计,金融,法学}
  validates :student_number, uniqueness: {message: '不允许重复'}
  has_many :details
end
