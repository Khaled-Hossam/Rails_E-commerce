Rails.application.routes.draw do
  # resources :carts
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :roles
  resources :coupons
  resources :orders
  resources :ratings
  resources :states
  resources :order_products
  resources :images
  resources :products
  resources :stores
  get 'home/index'
  resources :brands
  resources :categories

  # post 'carts/add_product'
  # get 'carts/get_cart'
  scope '/me' do
    get '/cart', to: 'cart#index'
  end
  
  scope '/api/me' do
    get '/cart/get_products' 
    post '/cart/add_product'
    put '/cart/update_product'
    delete '/cart/remove_product'
end

  # scope '/me' do
  #   get '/cart'
  #   get '/wishlist'
  #   get '/orders'
  # end

  

  devise_for :users do
    get 'users/sign_up', to: 'users/registrations/new#create'
  end
  

  root 'home#index'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
