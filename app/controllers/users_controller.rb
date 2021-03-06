class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy follow unfollow ]
  before_action :authenticate_user! 

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
    # if current_user.id != params[:id].to_i
    #   redirect_to "/users/#{current_user.id}"
    # end
    @user = User.find(params[:id].to_i)
    @is_following = false
    current_user.followings.each do |following|
      if following.id == @user.id
        @is_following = true
        break
      end
    end
    @images = @user.images.where(bought: false).order(created_at: :desc)
    @bought_images = @user.images.where(bought: true).order(created_at: :desc)
    @bought_galleries = @user.galleries.where(bought: true).order(updated_at: :desc)
    @galleries = @user.galleries.where(bought: false).order(created_at: :desc)
  end


  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # def update_status
  #   if authenticate_if_admin!
  #     if single_trader.update(status: 'approved')
  #       TraderMailer.with(trader: single_trader).approved_account_receipt.deliver_later
  #       render json: { status: 'approved', message: 'Trader status changed to approved' }, status: 200
  #     else
  #       render json: { error: 'Trader status change failed' }, status: 422
  #     end
  #   else
  #     render json: { error: 'You are not authorized to view this page.' }, status: 401
  #   end
  # end

  # DELETE /users/1 or /users/1.json
  def destroy
    current_user.destroy

    respond_to do |format|
      format.html { redirect_to root_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  
  def follow 
    Follow.create({
      :follower_id => current_user.id,
      :followed_user_id => @user.id 
    })
    redirect_to "/users/#{@user.id}" #needs to remove this 
  end

  def unfollow
    Follow.where(follower_id: current_user.id, followed_user_id: @user.id).destroy_all
    redirect_to "/users/#{@user.id}"
  end
  private

    def get_user
      @user = User.find(params[:user_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username, :name, :email, :profile_picture, :balance, :bio)
    end
end
