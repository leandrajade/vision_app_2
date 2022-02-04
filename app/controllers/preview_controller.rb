class PreviewController < ApplicationController
    def index
        @images = Image.all
        # @images = Image.where(bought: false).or(Image.where('price != 0')).order(updated_at: :desc).all
    end  
end