class ImgUploader < CarrierWave::Uploader::Base

    include Cloudinary::CarrierWave 
    include CarrierWave::RMagick

    version :normal do
        process :auto_orient
    end

    def auto_orient
        manipulate! do |img|
        img.auto_orient!
        end
    end
end