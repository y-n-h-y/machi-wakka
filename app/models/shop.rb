class Shop < ApplicationRecord

  has_many :top_banners, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :services, dependent: :destroy
  has_many :news, dependent: :destroy
  has_many :reviews, dependent: :destroy

  belongs_to :customer
end
