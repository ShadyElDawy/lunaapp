class ReviewsCsvImportJob
    include Sidekiq::Worker
  
    def perform(file_path)
      ReviewsCsvImporter.new(file_path).import
    end
  end
  