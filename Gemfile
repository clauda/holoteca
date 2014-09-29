source 'https://rubygems.org'
ruby '2.1.3'

gem 'rails', '4.1.6'

gem 'mongoid', git: 'https://github.com/mongoid/mongoid.git'
gem 'jbuilder', '~> 2.0'
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
gem 'sass-rails', '~> 4.0.3'
gem 'coffee-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'therubyracer'

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
gem 'dotenv-rails'

group :development do
  gem 'spring'

  gem 'capistrano', require: false
  gem 'capistrano-rails', require: false
  gem 'rvm1-capistrano3', require: false
  gem 'capistrano-bundler', require: false

  gem 'foreman'
  gem 'thin'
  gem 'mailcatcher'
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :development, :test do
  gem 'pry'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 3.0'
  gem 'mongoid-rspec'
  gem 'simplecov', require: false
  gem 'factory_girl_rails'
  gem 'database_cleaner'
end

group :production, :staging do
  gem 'rails_12factor'
  gem 'unicorn'
end