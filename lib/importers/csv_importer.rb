require 'smarter_csv'

class CsvImporter
  BATCH_SIZE = 1000

  def initialize(file_path)
    @file_path = file_path
  end

  def import
    SmarterCSV.process(@file_path.to_s, chunk_size: BATCH_SIZE) do |chunk|
      ActiveRecord::Base.transaction do
        process_chunk(chunk)
      end
    end
  end

  ##using insert to insert multiple records at once would be faster, but it would skip validations.
  def process_chunk(chunk)
    chunk.each do |row|
      create_record(row)
    end
  end

  def create_record(_row)
    raise NotImplementedError, 'Subclasses must implement the create_record method'
  end
end
