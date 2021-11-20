class Item < ApplicationRecord

  belongs_to :shop

  attachment :image

  validates :name, presence: true
  validates :content, presence: true
  validates :price, presence: true

  def tax_price
    (self.price * 1.10).round
  end
end
