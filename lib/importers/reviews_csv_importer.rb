class ReviewsCsvImporter < CsvImporter
  def create_record(row)
    movie = Movie.find_by(title: row[:movie])
    movie.reviews.create!(
      user: row[:user],
      stars: row[:stars],
      review: row[:review]
    ) if movie
  end
end
