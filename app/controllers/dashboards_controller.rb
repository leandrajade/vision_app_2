class DashboardsController < ApplicationController
  before_action :authenticate_user! 
  before_action :get_user

  # GET /dashboards or /dashboards.json
  def index
    @images = Image.where(bought: false).or(Image.where('price != 0')).order(updated_at: :desc).all
  end
  private
    def get_user
      @user = User.find(current_user.id)
    end
end
