class Issue < ActiveRecord::Base
  belongs_to :team_member
  belongs_to :student
  has_paper_trail
  enum status: [:reported, :in_progress, :missing_description, :closed]
end
