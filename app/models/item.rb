class Item < ApplicationRecord

  belongs_to :shop

  attachment :image

  def tax_price
    (self.price * 1.10).round
  end
end
