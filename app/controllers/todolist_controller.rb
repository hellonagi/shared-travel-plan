class TodolistController < ApplicationController
  before_action :require_login, only: [:new,:create, :edit, :update, :delete,:listdelete]

  #新しいtodoとtodolistを作成
  def new
    @todo = Todo.new
    @todo.todo_lists.build
  end

  #todo(todolist)を登録
  def create
    @todo=Todo.new(todo_params)
    
    if @todo.save
      redirect_to todo_path(@todo)
    else
      render 'new'
    end  
  end  
  
  # 各todolistの詳細を参照
  def todoshow
    @todo = Todo.includes(:todo_lists).find(params[:id])
    @todo_lists = @todo.todo_lists

    @image_urls = @todo_lists.map do |todolist|
      if todolist.image.attached?
        url_for(todolist.image)
      else
        nil
      end
    end.compact
  end
  #ユーザーが作成したTodoをすべて参照
  def usertodoshow
    @todo=Todo.includes(:todo_lists).where(user_id:params[:id])

    @todo_lists = @todo.todo_lists

    @image_urls = @todo_lists.map do |todolist|
      if todolist.image.attached?
        url_for(todolist.image)
      else
        nil
      end
    end.compact
  end
  
  #Todolistの更新
  def edit
    @todo=Todo.includes(:todo_lists).find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])
    #更新のTodolistとログイン中にユーザを比較
    if @todo.user_id==@current_user.id
      #一致していれば、更新
      if @todo.update(todo_params)
        redirect_to todo_path(@todo)
      #更新できない場合
      else
        render :edit
      end
    end    
  end

  #Todolistの削除
  def delete
    @todo = Todo.find(params[:id])
    if  @todo.user_id==@current_user.id  
      @todo.destroy
      redirect_to root_path
    end  
  end  

  def listdelete
    
    @todolist = Todolist.find(params[:id])
    @todo =Todo.find(@todolist.todo_id)

    if @todo.user_id==@current_user.id
      @todolist.destroy
      redirect_to todo_path(@todo)
    end
  end 

  
  private
  #パラメータ制御
  def todo_params
    params.require(:todo).permit(:id,:title, :description, :user_id, todo_lists_attributes: [:id,:latitude, :longitude, :details, :image])
  end

  #ログインが必要
  def require_login
    unless logged_in?
      redirect_to login_path, alert: "Please log in to continue"
    end
  end
end