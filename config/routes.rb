Rails.application.routes.draw do
  root to: 'discover_home#home'
  devise_for :users, path: "", path_names: {sign_in: "login", sign_out: "logout"}
  get "/preview", to: "preview#index", as: "preview"
  
  resources :users do
    resources :images
    resources :galleries
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/users/:id/unfollow", to: "users#unfollow", as: "unfollow_user"
  get "/users/:id/follow", to: "users#follow", as: "follow_user"

  get "/users/:id/home", to: "discover_home#home", as: "discover_home_home"
  get "/users/:id/discover", to: "discover_home#discover", as: "discover_home_discover"
  
  # get "/public", to: "discover_home#public", as: "discover_home_public"
  
  get "/images/:id/buy", to: "images#buy", as: "images_buy"  
  
  get "/galleries/:id/buy", to: "galleries#buy", as: "galleries_buy"  
  delete "/galleries/:id/remove", to: "galleries#remove_image", as: "remove_image"  
end
