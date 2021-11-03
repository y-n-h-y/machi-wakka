class Shop < ApplicationRecord

  has_many :top_banners, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :services, dependent: :destroy
  has_many :news, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy

  belongs_to :admin

  attachment :logo


  enum shop_genre: { gourmet: 0, shopping: 1, relaxation: 2, beauty_salon: 3, school: 4, private_school: 5,
                     dental: 6, hospital: 7, outdoor: 8, second_shop: 9, pet: 10,
                     life_support: 11, lear_estate: 12, ceremonial: 13

  }

  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end

end
