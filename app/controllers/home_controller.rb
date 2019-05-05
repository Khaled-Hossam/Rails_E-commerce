class HomeController < ApplicationController
  def index
    @products=  Product.all
  end
  def search  
    if params[:search].blank?  
      redirect_to(root_path, alert: "Empty field!") and return  
    else  
      @parameter = params[:search].downcase  
      @results = Product.all.where("lower(name) LIKE :search OR lower(description) LIKE :search" , search: "%#{@parameter}%")  
    end  
  end
end
