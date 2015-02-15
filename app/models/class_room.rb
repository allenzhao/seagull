class ClassRoom < ActiveRecord::Base
  validates :IP, uniqueness: true
  has_many :details

  def allowed_location?

  end

end
