class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product
  belongs_to :state

  class << self
    def get_items_in_order(order)
      @items=OrderProduct.where(order_id: order)
    end

  end
end
