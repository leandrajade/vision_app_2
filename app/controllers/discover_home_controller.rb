class DiscoverHomeController < ApplicationController
  before_action :authenticate_user!, except: %i[public]
  before_action :get_user, except: %i[public]

  def home
    @user_ids = current_user.followings.pluck(:id)
    @user_ids.push(current_user.id)
    @images = Image.where(user_id: @user_ids, bought: false).or(Image.where('user_id IN (?) AND price != 0', @user_ids)).order(updated_at: :desc).all
    @suggested_users = User.where.not(id: @user_ids).limit(5)
  end

  def discover
    @images = Image.where(bought: false).or(Image.where('price != 0')).order(created_at: :desc).all
  end

  def public
    # @images = Image.all
    @images = Image.where(bought: false).or(Image.where('price != 0')).order(updated_at: :desc).all
  end
  
  private
    def get_user
      @user = User.find(current_user.id)
    end
end
