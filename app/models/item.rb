class Item < ApplicationRecord

  belongs_to :shop

  attachment :image
end
