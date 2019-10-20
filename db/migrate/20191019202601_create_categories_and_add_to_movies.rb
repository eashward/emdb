# frozen_string_literal: true

class CreateCategoriesAndAddToMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.timestamps
    end
    remove_column :movies, :category
    add_reference :movies, :category
  end
end
