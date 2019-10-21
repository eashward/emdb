# frozen_string_literal: true

class Movie < ApplicationRecord
  # Movie.rating avg rating of a movie
  paginates_per 5
  MAX_RATING = 10

  has_many :ratings
  has_many :movies, through: :ratings
  belongs_to :category

  validates :title, presence: true

  def self.update_rating(vote)
    # presisted_votes + new_vote
    total_votes = ratings.count + 1
    new_rating = (total_votes * rating + vote) / total_votes
    new_rating = new_rating > MAX_RATING ? MAX_RATING : new_rating
    update!(rating: new_rating)
  end

  def self.search(str, page)
    all.joins(:category).order("categories.name asc").where('LOWER(title) LIKE ?', "%#{str.downcase}%").page page
  end
end
