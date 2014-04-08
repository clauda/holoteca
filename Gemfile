source 'https://rubygems.org'
ruby '2.1.1'

gem 'rails', '4.0.4'

gem 'mongoid', git: 'https://github.com/mongoid/mongoid.git'
gem 'jbuilder', '~> 1.2'
gem 'devise'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'inherited_resources'

# Caching
gem 'rack-cache'
gem 'actionpack-action_caching'
gem 'redis'
gem 'redis-rails'

# Assets
gem 'sass-rails', '~> 4.0.2'
gem 'coffee-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'turbolinks'

# Upload
gem 'carrierwave' #, git: 'git://github.com/jnicklas/carrierwave.git'
gem 'carrierwave-mongoid', git: 'git://github.com/jnicklas/carrierwave-mongoid.git', require: 'carrierwave/mongoid'
gem 'mongoid-grid_fs', github: 'ahoward/mongoid-grid_fs'
gem 'mini_magick', git: 'git://github.com/probablycorey/mini_magick.git'
gem 'piet'
gem 'piet-binary'
gem 'fog'

# SEO
gem 'sitemap_generator'
gem 'whenever', require: false

# Addons
gem 'rack-mini-profiler', require: false

group :development do
  gem 'capistrano'
  gem 'capistrano-rails'
  gem 'capistrano-rvm'
  gem 'capistrano-bundler'

  gem 'thin'
  gem 'mailcatcher'
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :development, :test do
  gem 'pry'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 2.14'
  gem 'mongoid-rspec'
  gem 'simplecov', :require => false
  gem 'factory_girl_rails'
  gem 'database_cleaner'
end

group :production do
  gem 'rails_12factor'
  gem 'unicorn'
end
