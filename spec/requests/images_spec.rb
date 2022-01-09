 require 'rails_helper'

RSpec.describe "/images", type: :request do

  let(:user) {User.create(username: 'leandrajade', name: 'leann panopio', email: 'leandrajade@gmail.com' )}
  let(:image) {Image.create(user_id: user.id, title: 'Holy Men', caption: 'Babê Çawîš, Êzîdî (Yezidi) Spiritual Leader. Photographed in Lalish temple, Iraq (Iraqi Kurdistan.)')}
  
  # before do
  #   @user = User.create(username: 'leandrajade', name: 'leann panopio', email: 'leandrajade@gmail.com' )
  #   @image = Image.create(user_id: @user, title: 'Holy Men', caption: 'Babê Çawîš, Êzîdî (Yezidi) Spiritual Leader. Photographed in Lalish temple, Iraq (Iraqi Kurdistan.)')
  # end

  # before do
  #   sign_in create(:user)
  # end
  let(:valid_attributes) {
    {
      # user_id: User.create(username: 'leandrajade', name: 'leann panopio', email: 'leandrajade@gmail.com').id,
      :user_id => User.create(username: 'leandrajade', name: 'leann panopio', email: 'leandrajade@gmail.com').id,
      title: 'Sample title',
      caption: 'Sample caption',
    }
  }

  let(:invalid_attributes) {
    # skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Image.create! valid_attributes
      get user_images_path(user.id)
      expect(response).to be_successful
    end
  end

  # user_image GET    /users/:user_id/images/:id
  describe "GET /show" do
    it "renders a successful response" do
      image = Image.create! valid_attributes
      get user_image_url(image)

      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_image_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      image = Image.create! valid_attributes
      get edit_image_url(image)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Image" do
        expect {
          post images_url, params: { image: valid_attributes }
        }.to change(Image, :count).by(1)
      end

      it "redirects to the created image" do
        post images_url, params: { image: valid_attributes }
        expect(response).to redirect_to(image_url(Image.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Image" do
        expect {
          post images_url, params: { image: invalid_attributes }
        }.to change(Image, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post images_url, params: { image: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested image" do
        image = Image.create! valid_attributes
        patch image_url(image), params: { image: new_attributes }
        image.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the image" do
        image = Image.create! valid_attributes
        patch image_url(image), params: { image: new_attributes }
        image.reload
        expect(response).to redirect_to(image_url(image))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        image = Image.create! valid_attributes
        patch image_url(image), params: { image: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested image" do
      image = Image.create! valid_attributes
      expect {
        delete image_url(image)
      }.to change(Image, :count).by(-1)
    end

    it "redirects to the images list" do
      image = Image.create! valid_attributes
      delete image_url(image)
      expect(response).to redirect_to(images_url)
    end
  end
end
