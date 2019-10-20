# frozen_string_literal: true

class SetRatingToZeroByDefault < ActiveRecord::Migration[5.2]
  def change
    change_column :movies, :rating, :integer, default: 0
  end
end
