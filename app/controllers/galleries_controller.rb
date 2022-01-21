class GalleriesController < ApplicationController
  before_action :set_gallery, only: %i[ show edit update destroy ]
  before_action :get_user

  # GET /galleries or /galleries.json
  def index
    @galleries = @user.galleries
  end

  # GET /galleries/1 or /galleries/1.json
  def show
    @gallery = Gallery.find(params[:id])
  end

  # GET /galleries/new
  def new
    @gallery = @user.galleries.build
    @images = @user.images.order(created_at: :desc)
  end

  # GET /galleries/1/edit
  def edit
    @galleries = Gallery.find(params[:id])
  end

  # POST /galleries or /galleries.json
  def create
    gallery_params[:user_id] = current_user.id
    image_ids = params[:image_ids]
    # gallery_params = gallery_params.destroy(:image_ids)
    @gallery = @user.galleries.build(gallery_params)

    respond_to do |format|
      if @gallery.save
        # image_ids.each do |image_id|
        #   GalleryImage.create({
        #     :gallery_id => @gallery.id,
        #     :image_id => image_id
        #   })
        # end
        format.html { redirect_to user_gallery_path(@user.id, @gallery), notice: "Gallery was successfully created." }
        format.json { render :show, status: :created, location: @gallery }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /galleries/1 or /galleries/1.json
  def update
    gallery_params[:user_id] = current_user.id
    respond_to do |format|
      if @gallery.update(gallery_params)
        format.html { redirect_to user_gallery_path(@user.id, @gallery), notice: "Gallery was successfully updated." }
        format.json { render :show, status: :ok, location: @gallery }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /galleries/1 or /galleries/1.json
  def destroy
    @gallery.destroy

    respond_to do |format|
      format.html { redirect_to user_galleries_url, notice: "Gallery was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def get_user
      @user = User.find(current_user.id)
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_gallery
      @gallery = Gallery.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def gallery_params
      params.require(:gallery).permit(:title, :caption, :image_ids, :gallery_price)
    end
end
