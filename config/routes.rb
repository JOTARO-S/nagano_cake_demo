Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers
  
  scope module: :public do
    root to: "homes#top"
    get "/about"=>"homes#about"
    
    resources :items, only: [:index,:show] 
    resources :cart_items, only: [:index,:update,:destroy,:create] 
    delete "cart_items/destroy_all" => "cart_items#destroy_all", as: "destroy_all"
    
    resources :orders, only: [:new,:confirm,:complete,:create,:index,:show]
  end
  
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
