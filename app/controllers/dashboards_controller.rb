class DashboardsController < ApplicationController
  before_action :authenticate_user! 
  before_action :get_user

  # GET /dashboards or /dashboards.json
  def index
    @images = Image.order(created_at: :desc).all
  end
  private
    def get_user
      @user = User.find(current_user.id)
    end
end
