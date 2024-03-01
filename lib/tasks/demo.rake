namespace :demo do
  desc 'Create sampler data'
  task recreate: [:environment] do
    return unless Rails.env.development?

    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    Rake::Task['db:migrate'].invoke
    Rake::Task['demo:reload'].invoke
    Rake::Task['db:seed'].invoke
    Rake::Task['demo:create'].invoke
  end

  task reload: [:environment] do
    Rails.application.eager_load!
    ApplicationRecord.descendants.each(&:reset_column_information)
  end

  task :create, [:count] => [:environment] do
    puts 'creating new data'

    FactoryBot.create :user
    colls = FactoryBot.create_list :collection, 7
    colls.each do |c|
      FactoryBot.create_list :writing, 20, collection: c
    end

    puts 'done!'
  end
end
