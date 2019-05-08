class Cart < ApplicationRecord
  belongs_to :product
  belongs_to :user
  # to make sure that every not cart_product have a negative or a zero value 




  after_update do |cart_product|
    self.delete if self.quantity.zero? || self.quantity.negative?
  end

  def product_id
    self.product.id
  end
  
  def product_name
    self.product.name
  end

  def product_price
    self.product.price
  end


  def product_instock_quantity
    self.product.instock_quantity
  end



  class << self
    def add_or_update_single_product_to_user_cart(product, user)
      if find_product_in_user_cart(product, user).present? 
        return increment_product_cart_quantity(product, user)
      end
      return insert_new_product_to_user_cart(product, user)
    end

    # create new record
    def insert_new_product_to_user_cart(product,user)
      create(product: product, user:user, quantity:1)
    end

    # find one
    def find_product_in_user_cart(product, user)
      find_by(product: product, user: user)    
    end

    # find all
    def find_all_products_in_user_cart(user)
      where(user: user)
    end

    

    # update cart product quantity by 1
    def increment_product_cart_quantity(product, user)
      cp=find_product_in_user_cart(product, user) 
      cp.update(quantity: cp.quantity+1)
      cp
    end

    # update cart product quantity by q
    def update_cart_product_quantity(product,user,quantity)
      find_product_in_user_cart(product, user).update(quantity: quantity)
    end

    # delete one
    def remove_product_from_user_cart(product,user)
      find_product_in_user_cart(product,user).delete
    end

    # delete all 
    def clear_user_cart(user)
      find_all_products_in_user_cart(user).delete_all
    end

    def get_total_price(user)
      Cart.find_all_products_in_user_cart(user).inject(0){ | acc , cp |
        acc+cp.product_price * cp.quantity 
      }
    end

  end
end