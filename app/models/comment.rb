class Comment < ApplicationRecord
  belongs_to :item
  belongs_to :user

  validates :price,    length: { minimum: 3 }  
end
