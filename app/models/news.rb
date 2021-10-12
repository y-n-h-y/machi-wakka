class News < ApplicationRecord

  belongs_to :shop

  attachment :image

  enum genre: { info: 0, blog: 1 }
end
