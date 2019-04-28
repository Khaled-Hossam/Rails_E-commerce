json.extract! rating, :id, :value, :comment, :product_id, :user_id, :created_at, :updated_at
json.url rating_url(rating, format: :json)
