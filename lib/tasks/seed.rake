namespace :cf do
  desc "Only run on the first application instance"
  task :on_first_instance do
    instance_index = JSON.parse(ENV["CF_INSTANCE_INDEX"]) rescue nil
    exit(0) unless instance_index == 0
    Rake::Task['db:seed'].invoke()
  end
end
