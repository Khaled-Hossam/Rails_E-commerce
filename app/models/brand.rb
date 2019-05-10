class Brand < ApplicationRecord
    class << self
        def get_products_by_brand(brand)
           return  Product.all.filter_by_brand(brand)
        end

    end
end
