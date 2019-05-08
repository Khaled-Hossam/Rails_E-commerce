class Order < ApplicationRecord
  belongs_to :user
  belongs_to :coupon, optional: true
  has_many :products
  has_many :order_products
  enum status: { pending: 0, confirmed: 1, delivered:2 }
  
  class << self

    def get_orders_for_current_user(user)

            @orders=Order.where(user_id: user.id)
            orderProducts=OrderProduct.where(order_id: @orders.first.id)

            orderProducts.each do |product|
              if product.status == "delivered"
                @orders.update(status: 2)
              elsif product.status =="confirmed"
                @orders.update(status: 1)
              else
                @orders.update(status: 0)
              end
            end

          return @orders

    end

    #
    def get_items_in_order_for_user(user)
      products=user.store.products
      @orderProducts=OrderProduct.where(product_id: products.ids)
    end




  end
  end




