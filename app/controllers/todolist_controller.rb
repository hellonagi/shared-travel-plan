class TodolistController < ApplicationController
  #新しいtodoとtodolistを作成
  def new
    @todo = Todo.new
    @todo.todo_lists.build
  end

  #todo(todolist)を登録
  def create
    @todo=Todo.new(todo_params)
    
    #不要なTodolistを削除
    @todo.todo_lists.reject! do |todo_list|
      todo_list.latitude.blank? && todo_list.longitude.blank? && todo_list.details.blank? && todo_list.image.blank?
    end

    if @todo.save
      redirect_to todo_path(@todo)
    else
      render 'new'
    end  
  end  
  
  # 各todolistの詳細を参照
  def todoshow
    @todo=Todo.includes(:todo_lists).find(params[:id])
  end
  #ユーザーが作成したTodoをすべて参照
  def usertodoshow
    @todo=Todo.includes(:todo_lists).where(user_id:params[:id])
  end
  
  #Todolistの更新
  def edit
    @todo=Todo.includes(:todo_lists).find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update(todo_params)
      redirect_to todo_path(@todo)
    else
      render :edit
    end
  end

  #Todolistの削除
  def delete
    @todo = Todo.find(params[:id])
    @todo.destroy
    redirect_to root_path
  end  

  def listdelete
    @todolist = Todolist.find(params[:id])
    @todo =Todo.find(@todolist.todo_id)
    @todolist.destroy
    redirect_to todo_path(@todo)
  end 

  
  private
  #パラメータ制御
  def todo_params
    params.require(:todo).permit(:id,:title, :description, :user_id, todo_lists_attributes: [:id,:latitude, :longitude, :details, :image])
  end
end
