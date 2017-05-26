Rails.application.routes.draw do
  devise_for :users
  get "pages/*page" => "pages#show"
  root "pages#show", page: "home"
  get "pages/help"
  get "pages/about"
  get "pages/contact"
  resources :users
end
