CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => (ENV['AWS_KEY_ID'] || 'any'),                     # required
    :aws_secret_access_key  => (ENV['AWS_SECRET'] || 'any'),                        # required
    :region                 => 'sa-east-1'                  # optional, defaults to 'us-east-1'
    # :path_style             => true
    # :host                   => 's3.example.com',             # optional, defaults to nil
    # :endpoint               => 'http://holozone.staging.s3-website-sa-east-1.amazonaws.com' # optional, defaults to nil
  }

  if Rails.env.production?
    config.fog_directory  =  'holozone'
  elsif Rails.env.staging?
    config.fog_directory  =  'zonestaging'
  end

  config.storage              = :grid_fs
  config.grid_fs_access_url   = '/uploads/archives'

  config.fog_public     = true                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end

