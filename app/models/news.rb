class News < ApplicationRecord

  belongs_to :shop

  attachment :image

  validates :title, presence: true
  validates :content, presence: true

  enum genre: { info: 0, blog: 1, event: 2 }
end
