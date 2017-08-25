Rails.application.routes.draw do
  root "home#index"

  get 'auth/github/callback', to: 'dashboard#index'
end
