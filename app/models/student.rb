class Student < ActiveRecord::Base
  includes Exportable
  enum school: [:site, :bs, :sfs, :sim, :sir, :spa, :scll, :sie, :sis, :ss, :sbf, :law]
  enum sex: [:male, :female]
  # %w{经贸,商学,外语,信息,国关,公管,中文,保险,英语,统计,金融,法学}
  validates :student_number, uniqueness: {message: '不允许重复'}
  has_many :details, dependent: :destroy
  has_one :schedule, dependent: :destroy
  has_many :error_logs, dependent: :destroy
  has_many :issues, dependent: :destroy

  #todo:现在不允许换课,要用detail 来处理,再思考

  def allow_checkin?
    Time.now.wday == self.schedule.weekday ? true : false
  end

  def display_name
    "#{self.student_number} #{self.name}"
  end

end
