json.extract! coupon, :id, :name, :expiration_date, :max_usage_number, :discount_percentage, :max_discount_amount, :created_at, :updated_at
json.url coupon_url(coupon, format: :json)
