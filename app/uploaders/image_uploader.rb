class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    %w[jpg jpeg gif png svg]
  end

  version :admin_thumb do
    process resize_to_limit: [200, 200]
  end

  version :index_size do
    process resize_to_limit: [300, 300]
  end
end
