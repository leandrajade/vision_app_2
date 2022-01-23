Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users, path: "", path_names: {sign_in: "login", sign_out: "logout"}
  resources :users do
    resources :images
    resources :galleries
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/users/:id/unfollow", to: "users#unfollow", as: "unfollow_user"
  get "/users/:id/follow", to: "users#follow", as: "follow_user"

  get "/users/:id/home", to: "home#index", as: "home_index"
  get "/users/:id/dashboards", to: "dashboards#index", as: "dashboards_index"
  
  get "/images/:id/buy", to: "images#buy", as: "images_buy"
  # get "/users/:user_id/images/:id/buy", to: "images#buy", as: "images_buy"
  
end
