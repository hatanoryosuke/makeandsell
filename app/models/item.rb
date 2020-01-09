class Item < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :comments

  def self.search(search)
    return Item.all unless search
    Item.where('name LIKE(?)', "%#{search}%")
  end
end
