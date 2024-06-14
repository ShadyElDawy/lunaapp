class MoviesCsvImportJob
    include Sidekiq::Worker
  
    def perform(file_path)
      MoviesCsvImporter.new(file_path).import
    end
  end
  