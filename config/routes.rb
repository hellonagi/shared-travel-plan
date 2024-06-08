Rails.application.routes.draw do
  # get  'todos/new',    to: 'todos#new',    as: 'new_todo'
  post 'todos', to: 'todos#create', as: 'create_todo'

  # todo(todolist)を作成
  get  'todolist/new',    to: 'todolist#new',    as: 'new_todolist'
  post 'todolist/create', to: 'todolist#create', as: 'create_todolist'

  # todoを参照
  get 'todolist/:id',     to: 'todolist#todoshow', as: 'todo'
  get 'todolist/users/:id', to: 'todolist#usertodoshow'

  # todoを更新
  get 'todolist/:id/edit', to: 'todolist#edit'
  patch 'todolist/:id', to: 'todolist#update', as: 'update_todolist'

  # todoを削除
  delete 'todo/:id',       to: 'todolist#delete', as: 'tododelete'
  delete 'todolist/:id',   to: 'todolist#listdelete', as: 'listdelete_todolist'

  # todostate(todoを追加)
  get  'todostates/new',    to: 'todostates#new'
  post 'todostates/create', to: 'todostates#create', as: 'add_todo'

  # todoの状況を参照
  get 'todostates/:id',     to: 'todostates#show', as: 'todostate'

  # todoの状況を更新
  patch 'todostates/:id', to: 'todostates#update', as: 'update_status'

  root 'todos#index'
  get  '/signup', to: 'users#new'
  post '/users', to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  post 'search', to: 'maps#search', as: 'search_places'

  resources :comments, only: %i[index show]
end
