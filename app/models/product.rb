class Product < ApplicationRecord
  has_one_attached :image 
  # belongs_to :image
  belongs_to :category
  belongs_to :brand
  belongs_to :store
  
  class << self
    def filter_by_store(store)
      where(store: store)
    end
    def word_search(word)
      where("lower(name) LIKE :search OR lower(description) LIKE :search" , search: "%#{word}%") 
        end
    def filter_by_brand(brand_id)
      where("(brand_id) = #{brand_id}")
    end

    def filter_by_category(category_id)
      where("(category_id) = #{category_id}")
    end
    def filter_by_price(price)
      where("(price) between #{price[1]} and  #{price[5]}")
    end

    def filter_by_seller(seller)
      where("(store_id) = #{seller}")
    end
  end
end
