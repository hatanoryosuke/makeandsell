class Genre < ApplicationRecord
  has_many :genre_items
  has_many :items, through: :genre_items
  validates :name, presence: true, uniqueness: true
end
