Rails.application.routes.draw do
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
  resources :cart_products

  devise_for :users do
    get 'users/sign_up', to: 'users/registrations/new#create'
  end
  

  root 'home#index'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
