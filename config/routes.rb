Rails.application.routes.draw do
  root to: 'home#home'
  devise_for :users, path: "", path_names: {sign_in: "login", sign_out: "logout"}
  resources :users do
    resources :images
    resources :galleries
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/users/:id/unfollow", to: "users#unfollow", as: "unfollow_user"
  get "/users/:id/follow", to: "users#follow", as: "follow_user"

  get "/users/:id/home", to: "home#home", as: "home_home"
  get "/users/:id/discover", to: "home#discover", as: "home_discover"
  
  get "/images/:id/buy", to: "images#buy", as: "images_buy"
  # get "/users/:user_id/images/:id/buy", to: "images#buy", as: "images_buy"
  
end
