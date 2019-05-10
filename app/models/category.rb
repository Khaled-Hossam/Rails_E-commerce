class Category < ApplicationRecord
    class << self
        def get_products_by_category(category_id)
           return  Product.all.filter_by_category(category_id)
        end

    end

end
