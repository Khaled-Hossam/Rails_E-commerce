class Order < ApplicationRecord
  belongs_to :state
  belongs_to :user
  belongs_to :coupon, optional: true
  has_many :products
  has_many :order_products

  class << self

    def get_orders_for_current_user(user)
      @orders=Order.where(user_id: user.id)
    end

    def get_items_in_order_for_user(order)
        @items=OrderProduct.get_items_in_order(order)
    end



  end

end
