class HomeController < ApplicationController
  def index
    @products=  Product.limit(6)
  end
  def search  
    if params[:brand]
      @brand = Integer(params[:brand])
      @parameter = session[:search].downcase  
      @results = Product.all.where("lower(name) LIKE :search OR lower(description) LIKE :search" , search: "%#{@parameter}%").where("(brand_id) = #{@brand}")
  
    elsif params[:category]
      @category = Integer(params[:category])
      @parameter = session[:search].downcase  
      @results = Product.all.where("lower(name) LIKE :search OR lower(description) LIKE :search" , search: "%#{@parameter}%").where("(category_id) = #{@category}")

    elsif  params[:seller]
      @seller = Integer(params[:seller])
      @parameter = session[:search].downcase  
      @results = Product.all.where("lower(name) LIKE :search OR lower(description) LIKE :search" , search: "%#{@parameter}%").where("(store_id) = #{@seller}")

    elsif  params[:price]
      @price = params[:price].split(/[^\d]/)
      @parameter = session[:search].downcase 
      @results = Product.all.where("lower(name) LIKE :search OR lower(description) LIKE :search" , search: "%#{@parameter}%").where("(price) between #{@price[1]} and  #{@price[5]}")


    elsif params[:search].blank?  
      redirect_to(root_path, alert: "Empty field!") and return  
    else  
      @parameter = params[:search].downcase  
      @results = Product.all.where("lower(name) LIKE :search OR lower(description) LIKE :search" , search: "%#{@parameter}%") 
      session[:search] = params[:search]
 
    end  
    @parameter = session[:search].downcase  
    @words = Product.all.where("lower(name) LIKE :search OR lower(description) LIKE :search" , search: "%#{@parameter}%")  
  end
   

end
