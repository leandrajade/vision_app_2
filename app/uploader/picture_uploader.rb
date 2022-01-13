
class PictureUploader < CarrierWave::Uploader::Base

  include Cloudinary::CarrierWave 
  include CarrierWave::RMagick

  version :normal do
    process :auto_orient
  end

  def auto_orient
    manipulate! do |picture|
      picture.auto_orient!
    end
  end
end
