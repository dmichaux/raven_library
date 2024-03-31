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
    genres = FactoryBot.create_list(:genre, 5)

    colls = genres.map do |g|
      FactoryBot.create_list(:collection, 3, :published, genre: g)
    end.flatten

    colls.each do |c|
      FactoryBot.create_list(:writing, 12, :published, collection: c)
    end

    puts 'done!'
  end
end
