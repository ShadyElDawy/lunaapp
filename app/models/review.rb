class Review < ApplicationRecord
    belongs_to :movie
    validates :user, presence: true
    validates :stars, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
    validates :review, presence: true
end