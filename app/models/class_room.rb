class ClassRoom < ActiveRecord::Base
  validates :IP, uniqueness: true
  has_many :details

  def allowed_location?
    early = CFG['allowed_location'][self.location.downcase]['start']
    late = CFG['allowed_location'][self.location.downcase]['end']
    (Time.now.hour >= early && Time.now.hour <= late) ? true : false
  end

end
