Holoteca::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  config.action_controller.asset_host = 'localhost:3000'
  config.action_mailer.asset_host = 'http://localhost:3000'

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = false
  # config.action_dispatch.rack_cache = true
  
  # Caching disabled by default
  config.action_controller.perform_caching = false
  config.cache_store = :memory_store
  # config.cache_store = :redis_store, 'redis://localhost:6379/0/hololololo', { expires_in: 60.minutes }
  # config.static_cache_control = 'public, max-age=2592000'
  # config.action_dispatch.rack_cache = true

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  config.action_mailer.default_url_options = { host: 'localhost:3000' }
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = { address: "localhost", port: 1025 }
end
