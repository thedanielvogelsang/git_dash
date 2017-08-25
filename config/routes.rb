Rails.application.routes.draw do
  root "home#index"
  get 'auth/github/callback', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :dashboard, only: [:index, :show]
  get 'open_pull_requests', to: 'dashboard#open_pulls'
end
