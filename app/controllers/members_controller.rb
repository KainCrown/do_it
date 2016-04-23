class MembersController < ApplicationController
  before_filter :find_project
  before_filter :check_members_uniqueness, only: :create
  before_filter :find_member

  def create
    unless @message
      @project.users.push(@member)
      @message = 'Success!'
      @member_html = render_to_string partial: 'users/elements/user', locals: { user: @member }, layout: false
    end
    respond_to do |format|
      format.html { redirect_to :back }
      format.js { render layout: false }
    end
  end

  def destroy
    @project.users.delete(@member)
    @message = 'Success!'
    respond_to do |format|
      format.html { redirect_to :back }
      format.js { render layout: false }
    end
  end

  private

  def find_project
    @project = Project.find(params[:project_id])
  end

  def check_members_uniqueness
    if @project.user_ids.include?(params[:members].to_i) || params[:members].nil?
      @message = 'Members must be uniq.'
    end
  end

  def find_member
    @member = User.find(params[:members] || params[:id])
  end
end
