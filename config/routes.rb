Rails.application.routes.draw do
  get "pages/*page" => "pages#show"
  get "pages/help"
  get "pages/about"
  get "pages/contact"
  root "pages#show", page: "home"
end
