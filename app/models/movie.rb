# frozen_string_literal: true

class Movie < ApplicationRecord
  # Movie.rating avg rating of a movie
  MAX_RATING = 10

  has_many :ratings
  has_many :movies, through: :ratings
  belongs_to :category

  validates :title, presence: true

  def update_rating(vote)
    total_votes = ratings.count + 1 # presisted_votes + new_vote
    new_rating = (total_votes * rating + vote) / total_votes
    byebug
    new_rating = new_rating > MAX_RATING ? MAX_RATING : new_rating
    update!(rating: new_rating)
  end
end
