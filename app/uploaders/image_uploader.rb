# encoding: utf-8

require 'carrierwave/processing/mini_magick'

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  include Sprockets::Rails::Helper
  include Piet::CarrierWaveExtension

  process :optimize

  if Rails.env.development?
    storage :grid_fs
  else
    storage :fog
  end

  # Piet.pngquant "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "#{model.id}"
  end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  process :resize_to_fit => [ 680, 320 ]

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :resize_to_fit => [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

  def default_url
    asset_path("fallback/" + [version_name, "default-photo.png"].compact.join('_'))
  end

end
