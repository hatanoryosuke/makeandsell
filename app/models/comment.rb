class Comment < ApplicationRecord
  belongs_to :item
  belongs_to :user

  validates :price,    length: { in: 3..6 }, allow_nil: true	
  validates :text,    length: { maximum: 100 }
  validates :text_or_price, presence: true

  private
    def text_or_price
      text.presence or price.presence
    end
end
