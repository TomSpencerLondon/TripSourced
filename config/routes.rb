Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :lists do
    member do 
      patch :move
    end 
  end

  resources :cards do
    member do 
      patch :move
    end 
  end 

  root to: 'lists#index'
end
