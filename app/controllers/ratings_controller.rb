# frozen_string_literal: true

class RatingsController < ApplicationController
  # @return [rating]
  def create
    params = params.require(:rating).permit(:vote, :movie_id)
    attrs = { user_rating: params[:vote], movie_id: params[:movie_id] }
    current_user.ratings.create!(attrs)
  end
end
