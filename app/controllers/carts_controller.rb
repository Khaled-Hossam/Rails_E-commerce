class CartsController < ApplicationController
  # before_action :set_cart, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token


  def add_product    
    cart_product = Cart.find_by({product_id: params['product_id'], user:current_user})
    if cart_product
      byebug
      cart_product.update_attribute(quantity: cart_product.quantity+1)
    else
      Cart.create({product_id: params['product_id'], user:current_user, quantity:1})
    end
    
  end



end
