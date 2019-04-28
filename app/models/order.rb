class Order < ApplicationRecord
  belongs_to :state
  belongs_to :user
  belongs_to :coupon, optional: true
end
