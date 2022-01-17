Rails.application.routes.draw do
  resources :dashboards
  root to: 'dashboards#index'
  devise_for :users
  resources :users do
    resources :images
    resources :galleries
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
