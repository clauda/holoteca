worker_processes Integer(ENV['WEB_CONCURRENCY'] || 3)
timeout 15
preload_app true

before_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  if defined?(Redis)
    # this throws errors
    # Redis.current tries to connect localhost
    Redis.current.quit
  end
end

after_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end

  if defined?(Redis)
    Redis.current = Redis.new(url: ENV['REDISCLOUD_URI'])
  end
end