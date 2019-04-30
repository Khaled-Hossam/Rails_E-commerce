class HomeController < ApplicationController
  def index
    @products=  Product.all
    puts @products
  end
end
