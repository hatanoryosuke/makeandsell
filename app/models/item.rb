class Item < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :item

  def self.search(search)
    return Item.all unless search
    Item.where('name LIKE(?)', "%#{search}%")
  end
end
