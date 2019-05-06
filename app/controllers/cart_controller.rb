class CartController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    def index
        @products=Cart.find_all_products_in_user_cart(current_user)
    end

    def get
        render json: Cart.find_all_products_in_user_cart(current_user)
    end

    def add_product
        
        render json: Cart.add_or_update_single_product_to_user_cart(
            Product.find(params['product_id']) ,
            current_user)
    end

    def update_product
        Cart.update_cart_product_quantity(
            Product.find(params['product_id']) ,
            current_user, params['quantity'])
            
        render json: Cart.find_all_products_in_user_cart(current_user)
    end

    def remove_product

    end



end
