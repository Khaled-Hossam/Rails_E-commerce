class Product < ApplicationRecord
  has_one_attached :image
  # belongs_to :image
  belongs_to :category
  belongs_to :brand
  belongs_to :store
end
