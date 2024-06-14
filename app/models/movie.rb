class Movie < ApplicationRecord
    has_many :reviews, dependent: :destroy

    validates :title, presence: true
    validates :year, numericality: { only_integer: true }
    validates :actor, presence: true

    scope :sort_by_average_stars, -> {
        left_joins(:reviews)
          .group(:id)
          .order(Arel.sql("COALESCE(AVG(reviews.stars), 0) DESC NULLS LAST"))
    }
    
    scope :by_actor, ->(actor) { where("actor LIKE ?", "%#{actor}%") if actor.present? }

end
