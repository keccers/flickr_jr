class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file
  process :resize_to_fit => [700, nil]

  def store_dir
    'public/uploads'
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
  
end
