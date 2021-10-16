class Item < ApplicationRecord

  belongs_to :shops

  attachment :image
end
