require 'rails_helper'

RSpec.describe "/users", type: :request do
  
  let(:valid_attributes) {
    {name: 'Leandra Jade Panopio',
    username: 'leandrajade',
    email: 'leandrajade@gmail.com',
    password: 'password',}
  }

  let(:invalid_attributes) {
    {name: nil,
    username: nil,
    email: nil,}
  }

  describe "GET /index" do
    it "renders a successful response" do
      user = User.create! valid_attributes
      get users_url
      expect(response).to be_successful
      expect(response.body).to include(user.name)
      expect(response.body).to include(user.username)
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      user = User.create! valid_attributes
      get user_url(user)
      expect(response).to be_successful
      expect(response.body).to include(user.name)
      expect(response.body).to include(user.username)
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_user_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      user = User.create! valid_attributes
      get edit_user_url(user)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new User" do
        expect {
          post users_url, params: { user: valid_attributes }
        }.to change(User, :count).by(1)
      end

      it "redirects to the created user" do
        post users_url, params: { user: valid_attributes }
        expect(response).to redirect_to(user_url(User.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new User" do
        expect {
          post users_url, params: { user: invalid_attributes }
        }.to change(User, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post users_url, params: { user: invalid_attributes }
        expect(response).to have_http_status(422)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { name: 'Meghan Ann Watson',
          username: 'meghanann',
          email: 'meghanannwatson@gmail.com',
          password: 'password',
        }
      }

      it "updates the requested user" do
        user = User.create! valid_attributes
        patch user_url(user), params: { user: new_attributes }
        user.reload
        expect(user.name).to eq('Meghan Ann Watson')
        expect(user.username).to eq('meghanann')
        expect(user.email).to eq('meghanannwatson@gmail.com')
      end

      it "redirects to the user" do
        user = User.create! valid_attributes
        patch user_url(user), params: { user: new_attributes }
        user.reload
        expect(response).to redirect_to(user_url(user))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        user = User.create! valid_attributes
        patch user_url(user), params: { user: invalid_attributes }
        expect(response).to have_http_status(422)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested user" do
      user = User.create! valid_attributes
      expect {
        delete user_url(user)
      }.to change(User, :count).by(-1)
    end

    it "redirects to the users list" do
      user = User.create! valid_attributes
      delete user_url(user)
      expect(response).to redirect_to(users_url)
    end
  end
end
