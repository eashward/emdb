# frozen_string_literal: true

class Rating < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  after_save :update_rating_on_movie

  # updating rating on movie
  # when user vote for a movie or updated it
  def update_rating_on_movie
    movie.update_rating(user_rating)
  end
end
