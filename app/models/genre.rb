class Genre < ApplicationRecord
  has_many :genre_items
  has_many :users, through: :group_users
  validates :name, presence: true, uniqueness: true
end
