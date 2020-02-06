class Item < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :comments, dependent: :delete_all
  has_many :genre_items
  has_many :genres, through: :genre_items

  validates :text,    length: { maximum: 200 }  

  def self.search(search)
    return Item.all unless search
    Item.where('name LIKE(?)', "%#{search}%")
  end
end
