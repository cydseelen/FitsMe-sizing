Rails.application.routes.draw do
  devise_for :users
  root to: 'brands#home'

  resources :customer_data, only: [:new, :create]

  resources :brand, shallow: true do
    resources :product
    resources :product_size
  end 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
