class Review < ApplicationRecord

  belongs_to :shop
  belongs_to :customer
end
