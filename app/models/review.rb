class Review < ApplicationRecord

  belongs_to :shop
  belongs_to :customer

  validates :title, presence: true
  validates :content, presence: true
end
