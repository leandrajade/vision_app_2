class ProfilePictureUploader < CarrierWave::Uploader::Base

    include Cloudinary::CarrierWave 
    include CarrierWave::RMagick

    version :normal do
        process :auto_orient
        # process :resize_to_fill => [60,60]
    end

    def auto_orient
        manipulate! do |profilepic|
        profilepic.auto_orient!
        end
    end

    # def resize_to_fill 
    #     manipulate! do |profilepic|
    #     profilepic.resize_to_fill!
    #     end
    # end
end