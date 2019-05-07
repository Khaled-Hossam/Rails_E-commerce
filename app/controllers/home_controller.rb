class HomeController < ApplicationController
  def index
    @products=  Product.limit(6)
  end

  #to change the rails error page when route doessn't match
  def not_found
    # Your exception handling code here
    render "errors/404"
  end
  
end
