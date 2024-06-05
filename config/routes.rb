Rails.application.routes.draw do
  root 'maps#index'
  get  '/signup', to: 'users#new'
end
