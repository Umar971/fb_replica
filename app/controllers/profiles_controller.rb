class ProfilesController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find_by(id: params[:user_id])
    @request = Request.find_by(sender_id: current_user.id)
  end
end
