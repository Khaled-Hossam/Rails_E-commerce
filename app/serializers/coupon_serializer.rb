class CouponSerializer < ActiveModel::Serializer
  attributes :id, :name, :max_discount_amount, :discount_percentage

end
