class HomeController < ApplicationController
  before_action :authenticate_user! 
  before_action :get_user

  def index
    @images = Image.where(user_id: current_user.followings.pluck(:id)).order(created_at: :desc).all
  end
  private
    def get_user
      @user = User.find(current_user.id)
    end
end
  