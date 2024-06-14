class Movie < ApplicationRecord
    has_many :reviews, dependent: :destroy

    scope :with_average_stars, -> { 
        select('movies.*, COALESCE(AVG(reviews.stars), 0) AS average_stars')
          .left_joins(:reviews)
          .group('movies.id')
          .order('average_stars DESC NULLS LAST')
      }
    
      scope :by_actor, ->(actor) { where("actor LIKE ?", "%#{actor}%") if actor.present? }

end
