Holoteca::Application.config.session_store :redis_store, redis_server: ENV['REDISTOGO_URL'], expires_in: 30.minutes
