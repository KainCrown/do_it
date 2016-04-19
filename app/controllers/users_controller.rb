class UsersController < ApplicationController
  layout false
  respond_to :html, :json

  def index
    @users = User.where("email like ? or name like ?", "%#{params[:q]}%", "%#{params[:q]}%")
  end
end
