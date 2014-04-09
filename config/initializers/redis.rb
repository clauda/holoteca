uri = URI.parse(ENV['REDISTOGO_URL'] || 'redis://localhost:6379/0/holoteca')
REDIS = Redis.new(:url => ENV['REDISTOGO_URL'] || 'redis://localhost:6379/0/holoteca')
