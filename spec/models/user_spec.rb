require 'rails_helper'

RSpec.describe User, type: :model do
  
  let(:user) {User.create(username: 'leandrajade', name: 'leann panopio')}

  let(:valid_attributes) {
    {
      name: 'new name',
      username: 'newusername',
      email: 'newuser@gmail.com',
      password: 123456
    }
  }

  context 'Validations' do
    it 'Creates a user if valid' do
      user = User.create! valid_attributes
      expect(User.count).to eq(1)
    end

    it 'Is not valid without a name' do
      user.name = nil

      expect(user).to be_invalid
      expect(user.errors).to be_present
      expect(user.errors.to_hash.keys).to include(:name)
    end

    it 'Is not valid without a username' do
      user.username = nil

      expect(user).to be_invalid
      expect(user.errors).to be_present
      expect(user.errors.to_hash.keys).to include(:username)
    end

    it 'cannot create a user without an email' do
      user.email = nil

      expect(user).to be_invalid
    end

    it "Is not valid when username is not unique" do
      user_duplicate = User.create(username: 'leandrajade', name: 'leann panopio', email: 'elle@gmail.com')

      expect(user).to be_invalid
      expect(user.errors).to be_present
    end
  end
end
