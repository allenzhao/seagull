class AddTeamMemberToIssue < ActiveRecord::Migration
  def change
    remove_reference :issues, :user
    add_reference :issues, :team_member
  end
end
