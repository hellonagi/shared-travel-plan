Rails.application.routes.draw do
  # todo(todolist)を作成
  get  'todolist/new',    to: 'todolist#new',    as: 'new_todolist'
  post 'todolist/create', to: 'todolist#create', as: 'create_todolist'

  #todoを参照
  get 'todolist/:id',     to: 'todolist#todoshow'  ,as: 'todo'
  get 'todolist/users/:id', to: 'todolist#usertodoshow'

  #todoを更新
  get 'todolist/:id/edit',to: 'todolist#edit'
  patch 'todolist/:id',   to: 'todolist#update'     ,as: 'update_todolist'

  #todoを削除
  delete 'todo/:id',       to: 'todolist#delete'    ,as: 'tododelete'
  delete 'todolist/:id',   to: 'todolist#listdelete',as: 'listdelete_todolist'

  root 'maps#index'
end

