class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :friends]
  
  def show
  end
  
  def friends
  end
  
  private
  
    def set_user
      @user = User.find_by(id: params[:user_id])
    end
end
