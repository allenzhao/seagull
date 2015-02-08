class AddUserRefToTeamMembers < ActiveRecord::Migration
  def change
    add_reference :team_members, :user, index: true
    add_foreign_key :team_members, :users
  end
end
