class Genre < ApplicationRecord
  has_many :genre_items
  has_many :items, through: :genre_itemss
  validates :name, presence: true, uniqueness: true
end
