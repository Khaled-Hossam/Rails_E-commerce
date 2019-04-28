Rails.application.routes.draw do
  resources :coupons
  resources :orders
  resources :ratings
  resources :states
  resources :order_products
  resources :images
  resources :products
  resources :brands
  resources :categories
  devise_for :users
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
