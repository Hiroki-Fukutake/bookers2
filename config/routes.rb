Rails.application.routes.draw do
devise_for :users
root to: "users#top"
get "/home/about" => "users#home"
resources :users
resources :books

end
