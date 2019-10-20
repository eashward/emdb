# frozen_string_literal: true

class Movie < ApplicationRecord
  # Movie.rating avg rating of a movie

  has_many :ratings
  has_many :movies, through: :ratings
  belongs_to :category

  validates :title, presence: true

  def update_rating(vote)
    total_votes = ratings.count + 1 # presisted_votes + new_vote
    new_rating = (total_votes * rating + vote) / total_votes
    update!(rating: new_rating)
  end
end
