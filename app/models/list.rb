class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  # the above line must appear first
  # because we can't call the movies table on the next line without having the bookmarks link
  has_many :movies, through: :bookmarks
  validates :name, presence: true, uniqueness: true
end
