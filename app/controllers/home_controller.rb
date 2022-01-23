class HomeController < ApplicationController
  before_action :authenticate_user! 
  before_action :get_user

  def index
    user_ids = current_user.followings.pluck(:id)
    user_ids.push(current_user.id)
    @images = Image.where(user_id: user_ids, bought: false).order(created_at: :desc).all
  end
  private
    def get_user
      @user = User.find(current_user.id)
    end
end
  