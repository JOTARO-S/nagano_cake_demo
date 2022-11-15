Rails.application.routes.draw do
  devise_for :admins
  
  
  devise_for :customers
    root to: "homes#top"
    get "/about"=>"homes#about"
    resources :items, only: [:index,:show] 
    resources :cart_items, only: [:index,:update,:destroy,:destroy_all,:create] 
    resources :orders, only: [:new,:confirm,:complete,:create,:index,:show]
  
  devise_for :users
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
