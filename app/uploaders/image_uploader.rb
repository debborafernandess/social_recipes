# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    Cloudinary::Api.resource('cooking')['url']
  end

  # Process files as they are uploaded:
  process :scale => [300, 300]

  # def scale(width, height)
  #   # do something
  # end

  version :thumbnail do
    eager
    resize_to_fit(50, 50)
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
