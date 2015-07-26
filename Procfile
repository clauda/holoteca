web: bundle exec unicorn -p $PORT -c ./config/unicorn.rb
redis: redis-server
mailer: ruby -rbundler/setup -e "Bundler.clean_exec('mailcatcher', '-f', '--ip', '0.0.0.0')"
