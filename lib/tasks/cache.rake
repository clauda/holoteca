namespace :cache do
  desc "Clear All"
  task :clear => [:environment] do
    Rails.cache.clear
  end
end