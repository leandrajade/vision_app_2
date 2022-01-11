require 'rails_helper'

RSpec.describe Gallery, type: :model do
  let(:user) {User.create(username: 'leandrajade', name: 'leann panopio', email: 'leandrajade@gmail.com' )}
  let(:gallery) {Gallery.create(user_id: user.id, title: 'Ethiopia', caption: 'Ehtiopia series')}

  context 'Validations' do
    it 'Creates a gallery if valid' do

      expect {User.galleries.create(user_id: user.id, title: 'Title 2', caption: 'Caption 2').to change(User.find(1).galleries, :count).by(1)}
    end

    it 'cannot create without a user who uploaded' do  
      gallery.user_id = nil
      
      expect {gallery}.to change { Gallery.count }.by(0) 
    end

    it 'Is not valid without a title' do  
      gallery.title = nil
  
      expect(gallery).to be_invalid
      expect(gallery.errors).to be_present
      expect(gallery.errors.to_hash.keys).to include(:title)
    end

    it 'Is not valid with title characters more than 40' do
      gallery.title = '12345678901234567890123456789012345678901'

      expect(gallery).to be_invalid
      expect(gallery.errors).to be_present
      expect(gallery.errors.to_hash.keys).to include(:title)
    end
  end
  context 'Associations' do
    it 'Belongs to user' do
      expect(described_class.reflect_on_association(:user).macro).to eq(:belongs_to)
    end
  end
end
