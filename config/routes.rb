Rails.application.routes.draw do
  root to: 'users#current_user_home'
  devise_for :users
  resources :users do
    resources :images
    resources :galleries
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
