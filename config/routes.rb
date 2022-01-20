Rails.application.routes.draw do
  resources :dashboards
  resources :discover
  
  root to: 'dashboards#index'
  devise_for :users, path: "", path_names: {sign_in: "login", sign_out: "logout"}
  resources :users do
    resources :images
    resources :galleries
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/users/:id/unfollow", to: "users#unfollow", as: "unfollow_user"
  get "/users/:id/follow", to: "users#follow", as: "follow_user"
end
