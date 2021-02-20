Rails.application.routes.draw do
  devise_for :users
  root to: 'brands#home'

  resources :customer_data, only: [:new, :create]


  resources :user_products, only: [:show]

  resources :brands do
    resources :products
  end

  resources :products do
    resources :product_sizes, only: [:new, :create]
  end

  

  # resources :products do
  #   resources :products_sizes, only: [:new, :create]
  # end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
