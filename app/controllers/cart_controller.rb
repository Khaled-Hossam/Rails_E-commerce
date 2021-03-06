class CartController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    def index
        @products=Cart.find_all_products_in_user_cart(current_user)
        @cart_price = Cart.get_total_price(current_user)
    end

    def get_products
        render json: Cart.find_all_products_in_user_cart(current_user)
    end

    def add_product
        # byebug
        cp = Cart.add_or_update_single_product_to_user_cart(Product.find(params['product_id']) ,current_user)
        if cp.valid?
            return_with_success(cp, 204)
        else
            return_with_fail(cp.errors, 403)
        end
    end
    
    def return_with_success(data, code)
        render json: {
          valid: true,
          data: data
        }
    end

    def return_with_fail(errors, code)
      render json: {
        valid: false,
        error: errors

      }, status: code
    end

    def update_product
        render json: Cart.update_cart_product_quantity(
            Product.find(params['product_id']) ,
            current_user, params['quantity'])
        
    end

    def remove_product
    render json: Cart.remove_product_from_user_cart(
        Product.find(params['product_id']),
        current_user 
        )
    end

    def create_order
        Order.create(coupon_id: params['coupon_id'], user: current_user, )   
    end



end
