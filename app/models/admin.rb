class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items, dependent: :destroy
  has_many :news, dependent: :destroy
  has_many :services, dependent: :destroy
  has_many :top_banners, dependent: :destroy

  has_one :shop, dependent: :destroy

  def active_for_authentication?
    super && (self.is_active === "vaild")
  end

  enum is_active: { vaild: true, invaild: false }
end
