class IssuesController < ApplicationController

  before_action :set_issue, except: [:index, :create, :my_issues]

  def index
    @issues = Issue.order('updated_at DESC').page(params[:page])
    @issue = Issue.new
  end

  def show
  end

  def my_issues
    @issues = Issue.where(team_member_id: current_user.team_member.id).page(params[:page])
    @issue = Issue.new
    render 'index'
  end

  def create
    @issue = Issue.new(issue_params)
    if @issue.save
      @success = '保存成功'
    else
      @error = show_error @issue
    end
    render 'refresh_issue'
  end

  def edit
  end

  def update
    if @issue.update(issue_params)
      @success = '事务更新成功'
    else
      @error = show_error @issue
    end
    render 'refresh_issue'
  end

  def destroy
    if @issue.destroy
      @success = '删除成功'
    else
      @error = show_error @student
    end
    render 'refresh_issue'
  end

  private

  def set_issue
    @issue = Issue.find(params[:id])
  end

  def issue_params
    params.require(:issue).permit(:title, :description, :team_member_id, :student_id, :status)
  end

end