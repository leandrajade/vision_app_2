class DiscoverHomeController < ApplicationController
  before_action :authenticate_user!, except: %i[public_view]
  before_action :get_user, except: %i[public_view]

  def home
    @user_ids = current_user.followings.pluck(:id)
    @user_ids.push(current_user.id)
    @images = Image.where(user_id: @user_ids, bought: false).or(Image.where('user_id IN (?) AND price != 0', @user_ids)).order(updated_at: :desc).all
  end

  def discover
    # gallery_image_ids = GalleryImage.pluck(:image_id).map
    # @images = Image.where(bought: false).or(Image.where('price != 0')).or(Image.where(id: !gallery_image_ids)).order(updated_at: :desc).all
    @images = Image.where(bought: false).or(Image.where('price != 0')).order(updated_at: :desc).all
  end

  def public_view
    # @images = Image.all
    @images = Image.where(bought: false).or(Image.where('price != 0')).order(updated_at: :desc).all

  end
  
  private
    def get_user
      @user = User.find(current_user.id)
    end
end
