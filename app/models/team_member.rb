class TeamMember < ActiveRecord::Base
  validates :email, uniqueness: true, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, message: 'is not correct'}
  belongs_to :user, touch: true

  def full_name
    "#{self.last_name} #{self.first_name}"
  end
end
