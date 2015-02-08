class TeamMemberController < ApplicationController
  before_action :set_team_member, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @team_members = TeamMember.includes(:user).all
  end

  def edit
  end

  def update
    if @team_member.update(team_member_params)
      @success = '团队成员更新成功'
    else
      @error = show_error(@team_member)
    end
    @team_members = TeamMember.includes(:user).all
    render 'refresh_team_member'
  end

  def create
  end

  def destroy
  end

  def import
  end

  private
  def set_team_member
    @team_member = TeamMember.find(params[:id])
  end

  def team_member_params
    params.require(:team_member).permit(:first_name, :last_name, :phone_number, :email, :title)
  end
end
