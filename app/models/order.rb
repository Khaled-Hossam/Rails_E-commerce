class Order < ApplicationRecord
  belongs_to :user
  belongs_to :coupon, optional: true
  has_many :products
  has_many :order_products
  enum status: { pending: 0, confirmed: 1, delivered:2 }
  
  after_create do | order |
    cart_products = Cart.find_all_products_in_user_cart(order.user)

    cart_products.each { |cp| 
      OrderProduct.create(order: self, 
              product_id: cp.product_id,
              purchased_price: cp.product_price,
              quantity: cp.quantity)
    }

    Cart.clear_user_cart(self.user)

  end

  def items_count
    self.order_products.count
  end


  class << self

    def get_orders_for_current_user(user)

            @orders=Order.where(user_id: user.id)
            
            orderProducts=OrderProduct.where(order_id: @orders.first.id) if @orders.present?

            if orderProducts.present?
            orderProducts.each do |product|
              if product.status == "delivered"
                @orders.update(status: 2)
              elsif product.status =="confirmed"
                @orders.update(status: 1)
              else
                @orders.update(status: 0)
              end
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




