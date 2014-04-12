env = ENV['RAILS_ENV'] || 'development'

worker_processes 2
timeout 30
preload_app true

if env == 'production'

  root = "/var/www/holoteca"

  listen '/tmp/holoteca.sock', backlog: 64
  listen 8080, tcp_nopush: true

  # pid '/tmp/unicorn.holoteca.pid'
  pid "#{root}/shared/pids/unicorn.holoteca.pid"

  working_directory "#{root}/current"

  user 'claudia'

  stderr_path "#{root}/shared/logs/unicorn.stderr.log"
  stdout_path "#{root}/shared/logs/unicorn.stdout.log"

  # Force the bundler gemfile environment variable to
  # reference the capistrano "current" symlink
  before_exec do |_|
    ENV["BUNDLE_GEMFILE"] = File.join(root, 'Gemfile')
  end

end


before_fork do |server, worker|

  old_pid = "/tmp/unicorn.holoteca.pid.oldbin"
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # someone else did our job for us
    end
  end

end

after_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end
end