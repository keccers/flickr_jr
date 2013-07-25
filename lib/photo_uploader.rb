class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file
  process :resize_to_fill => [200, 200]

  def store_dir
    'public/uploads'
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
  
end
