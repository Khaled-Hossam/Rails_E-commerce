class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product
  enum status: { pending: 0, confirmed: 1, delivered:2 }



  class << self
    def get_items_in_order(order)
      @items=OrderProduct.where(order_id: order)
    end

  end
end
