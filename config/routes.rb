Rails.application.routes.draw do
  root 'maps#index'
  get  '/signup', to: 'users#new'
  post '/users', to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
