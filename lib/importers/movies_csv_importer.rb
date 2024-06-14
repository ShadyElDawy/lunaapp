class MoviesCsvImporter < CsvImporter
  def create_record(row)
    Movie.create!(
      title: row[:movie],
      description: row[:description],
      year: row[:year].to_i,
      director: row[:director],
      actor: row[:actor],
      filming_location: row[:filming_location],
      country: row[:country]
    )
  end
end
