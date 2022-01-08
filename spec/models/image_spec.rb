require 'rails_helper'

RSpec.describe Image, type: :model do

  let(:user) {User.create(username: 'leandrajade', name: 'leann panopio', email: 'leandrajade@gmail.com' )}
  let(:image) {Image.create(user_id: user.id, title: 'Holy Men', caption: 'Babê Çawîš, Êzîdî (Yezidi) Spiritual Leader. Photographed in Lalish temple, Iraq (Iraqi Kurdistan.)')}

  context 'Validations' do
    it 'Creates an image if valid' do

      expect {User.images.create(user_id: user.id, title: 'Title 2', caption: 'Caption 2').to change(User.find(1).images, :count).by(1)}
    end
   
    it 'cannot create without a user who uploaded' do  
      image.user_id = nil
      
      expect {image}.to change { Image.count }.by(0) 
    end

    it 'Is not valid without a title' do  
      image.title = nil
  
      expect(image).to be_invalid
      expect(image.errors).to be_present
      expect(image.errors.to_hash.keys).to include(:title)
    end

    it 'Is not valid with title characters more than 40' do
      image.title = '12345678901234567890123456789012345678901'

      expect(image).to be_invalid
      expect(image.errors).to be_present
      expect(image.errors.to_hash.keys).to include(:title)
    end
  end
  context 'Associations' do
    it 'Belongs to user' do
      expect(described_class.reflect_on_association(:user).macro).to eq(:belongs_to)
    end
  end
end
