class DiscoverController < ApplicationController
    # GET /dashboards or /dashboards.json
    def index
      @images = Image.order(created_at: :desc).all
    end
end
  