namespace :import do
    desc 'Import data from CSV files'
  
    task :all do
      Rake::Task['import:movies'].invoke
      Rake::Task['import:reviews'].invoke
    end
  
    task movies: :environment do
      puts 'Importing movies...'
      file_path = Rails.root.join('db/data/movies.csv').to_s
      MoviesCsvImportJob.perform_async(file_path)
      puts 'Movies import job has been enqueued!'
    end
  
    task reviews: :environment do
      puts 'Importing reviews...'
      file_path = Rails.root.join('db/data/reviews.csv').to_s
      ReviewsCsvImportJob.perform_async(file_path)
      puts 'Reviews import job has been enqueued!'
    end
end
  