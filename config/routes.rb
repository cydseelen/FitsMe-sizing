Rails.application.routes.draw do
  devise_for :users
  root to: 'brands#home'

  resources :customer_data, only: [:new, :create]

  resource :brand, shallow: true do
    resource :product
    resource :product_size
  end 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
