class Comment < ApplicationRecord
  belongs_to :item
  belongs_to :user

  validates :price,    length: { minimum: 3 }, allow_nil: true	
  validates :price,    length: { maximum: 6 }
  validates :text,    length: { maximum: 100 }
end
