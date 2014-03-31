source 'https://rubygems.org'
ruby '2.1.1'

gem 'rails', '4.0.4'

# Assets
gem 'sass-rails', '~> 4.0.2'
gem 'coffee-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'turbolinks'

gem 'mongoid', git: 'https://github.com/mongoid/mongoid.git'
gem 'jbuilder', '~> 1.2'
gem 'devise'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'inherited_resources'

gem 'carrierwave' #, git: 'git://github.com/jnicklas/carrierwave.git'
gem 'carrierwave-mongoid', git: 'git://github.com/jnicklas/carrierwave-mongoid.git', require: 'carrierwave/mongoid'
gem 'mongoid-grid_fs', github: 'ahoward/mongoid-grid_fs'
gem 'mini_magick', git: 'git://github.com/probablycorey/mini_magick.git'
gem 'piet'
gem 'piet-binary'
gem 'fog'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
gem 'unicorn'
gem 'pry'
gem 'dotenv-rails'
gem 'rack-mini-profiler', require: false
gem 'rails_12factor'

group :development do
  gem 'capistrano'
  gem 'capistrano-rails'
  gem 'capistrano-rvm'
  gem 'capistrano-bundler'
  gem 'mailcatcher'
  gem 'better_errors'
  gem 'binding_of_caller'
end

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

group :development, :test do
  gem 'thin'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 2.14'
  gem 'mongoid-rspec'
  gem 'simplecov', :require => false
  gem 'factory_girl_rails'
  gem 'database_cleaner'
end

