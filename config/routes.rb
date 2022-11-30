Rails.application.routes.draw do
  resources :memberships, only: [:create]
end
