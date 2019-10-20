# frozen_string_literal: true

class AddUserRatingToRatings < ActiveRecord::Migration[5.2]
  def change
    add_column :ratings, :user_rating, :integer
  end
end
