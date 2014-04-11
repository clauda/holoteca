if ENV['RAILS_ENV'] == 'production'

  root = "/var/www/holoteca/current"
  working_directory root
  pid "#{root}/tmp/pids/unicorn.pid"
  stderr_path "#{root}/log/unicorn.log"
  stdout_path "#{root}/log/unicorn.log"

  listen "/tmp/unicorn.holoteca.sock"

  # Force the bundler gemfile environment variable to
  # reference the capistrano "current" symlink
  before_exec do |_|
    ENV["BUNDLE_GEMFILE"] = File.join(root, 'Gemfile')
  end

end

worker_processes Integer(ENV['WEB_CONCURRENCY'] || 2)
timeout 15
preload_app true

before_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end
end

after_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end
end