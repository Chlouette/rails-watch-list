class Movie < ApplicationRecord
  has_many :bookmarks
  # if you're not calling the above line, the code movie.bookmarks won't work
  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true
end
