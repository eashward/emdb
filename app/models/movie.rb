class Movie < ApplicationRecord

  has_many :ratings
  has_many :movies, through: :ratings
  belongs_to :category

  validates :title, presence: true

end