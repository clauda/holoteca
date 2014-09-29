# config valid only for Capistrano 3.2.1
lock '3.2.1'

set :application, 'holoteca'
set :repo_url, 'git@github.com:krawdyah/holoteca.git'
set :branch, 'master'
set :deploy_to, '/var/www/holoteca'
set :deploy_via, :remote_cache
set :default_stage, 'production'
set :user, 'claudia'
set :ssh_options, { port: 5953, forward_agent: true }
set :use_sudo, false

set :rvm1_ruby_version, '2.1.3'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

# Default deploy_to directory is /var/www/my_app
# set :deploy_to, '/var/www/my_app'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
set :pty, true

# Default value for :linked_files is []
set :linked_files, %w{config/mongoid.yml .env}

# Default value for linked_dirs is []
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 2

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  desc 'Refresh sitemaps'
  task :sitemaps do
    %x('RAILS_ENV=production bundle exec rake sitemap:refresh')
  end

  after :published, :sitemaps
  after :finishing, :cleanup
  before :finished, :restart
  after :rollback, :restart
end

namespace :cache do

  task :clear do
    %x('RAILS_ENV=production bundle exec rake cache:clear')
  end

end

namespace :unicorn do

  desc "Start unicorn"
  task :start do
    on roles(:app), in: :sequence, wait: 5 do
      execute "cd #{current_path}; bundle exec unicorn -c config/unicorn.rb -D"
    end
  end

  desc "Stop unicorn"
  task :stop do
    on roles(:app), in: :sequence, wait: 5 do
      execute "kill -s QUIT `cat /var/www/holoteca/shared/unicorn.holoteca.pid`"
    end
  end

end

