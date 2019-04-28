json.extract! product, :id, :name, :description, :price, :instock_quantity, :image_id, :category_id, :brand_id, :store_id, :created_at, :updated_at
json.url product_url(product, format: :json)
