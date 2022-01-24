class ProfilePictureUploader < CarrierWave::Uploader::Base

    include Cloudinary::CarrierWave 
    include CarrierWave::RMagick

    version :normal do
        process :auto_orient
    end

    def auto_orient
        manipulate! do |profilepic|
        profilepic.auto_orient!
        end
    end
end