Rails.application.routes.draw do
  devise_for :users
  root "pages#show", page: "home"
  get "pages/*page" => "pages#show"
  get "pages/help"
  get "pages/about"
  get "pages/contact"
  resources :products
  resources :users do
    resources :relationships, only: [:index]
  end
  resources :relationships, only: [:create, :destroy]
end
