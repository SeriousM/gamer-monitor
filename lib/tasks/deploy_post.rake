namespace :deploy do
  desc "Executes all steps after the deployment"
  task post: :environment do
    puts "===== Running db:migrate ..."
    Rake::Task["db:migrate"].invoke
    puts "===== Running db:migrate done!"

    puts "===== Running db:mongoid:create_indexes ..."
    Rake::Task["db:mongoid:create_indexes"].invoke
    puts "===== Running db:mongoid:create_indexes done!"
  end
end