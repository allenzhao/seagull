class ClassRoom < ActiveRecord::Base
  validates :IP, uniqueness: true
  has_many :details

  def allowed_location?
    location = CFG['allowed_location'][self.location.downcase]
  end

end
