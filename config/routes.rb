Rails.application.routes.draw do
  root 'maps#index'
  get  '/signup', to: 'users#new'
  post '/users', to: 'users#create'
end
