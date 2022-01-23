class ImagesController < ApplicationController
  before_action :set_image, only: %i[ show edit update destroy buy ]
  before_action :get_user, except: %i[ buy ]

  # GET /images or /images.json
  def index
    @images = @user.images.order(created_at: :desc)
  end

  # GET /images/1 or /images/1.json
  def show
    @image = Image.find(params[:id])
  end

  def edit
    @images = Image.find(params[:id])
  end
  # GET /images/new
  def new
    @image = Image.new
  end


  # POST /images or /images.json
  def create
    @image = @user.images.build(image_params) 

    respond_to do |format|
      if @image.save
        format.html { redirect_to user_image_path(@user.id, @image), notice: "Image was successfully created." }
        format.json { render :show, status: :created, location: user_image_path(@user.id, @image.id) }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to user_image_path(@user.id, @image), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: user_image_path(@user.id, @image.id) }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /images/1 or /images/1.json
  def destroy
    @image.destroy

    respond_to do |format|
      format.html { redirect_to user_path(@user), notice: "Image was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def buy
    if current_user.balance >= @image.price
      current_user.balance = current_user.balance - @image.price
      current_user.save

      @image.user_id = current_user.id
      @image.bought = true
      @image.price = 0
      @image.save

      redirect_to user_path(current_user)
    else
      respond_to do |format|
        format.html { render 'images/insufficient_funds', status: :unprocessable_entity  }
      end
    end
  end

  private
    def get_user
      @user = User.find(params[:user_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def image_params
      params.require(:image).permit(:title, :caption, :img, :price)
    end
end
