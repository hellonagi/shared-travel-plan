class TodostatesController < ApplicationController
  before_action :require_login, only: %i[new create edit update delete]
  # 新しいTodoStateを作成

  def new
    @todos = Todo.includes(:todo_lists).all
  end

  def create
    todostate_params[:todostates].each do |todostate_param|
      todostate = Todostate.new(todostate_param)

      unless todostate.save
        @todos = Todo.includes(:todo_lists).all
        render :new and return
      end
    end
    redirect_to root_path, notice: 'Todostates were successfully created.'
  end

  # ユーザのステータスの状況を表示
  def show
    # TodoのidとTodolistのTodo_idを結合
    # TodolistsのidとTodostateのTodolist_idを結合し、
    # ユーザに絞る
    @todostate = Todo.joins(todo_lists: :todostates)
                     .where(todostates: { user_id: params[:id] })
                     .select('todos.title, todostates.*,
             todolists.latitude,todolists.longitude')
  end

  # Statusを更新
  def update
    @todostate = Todostate.find_by(todolist_id: params[:id])
    @todostate.status = !@todostate.status # statusを反転させる
    if @todostate.save
      redirect_to todostate_path(@todostate.user_id), notice: 'Status was successfully updated.' # 更新成功時のリダイレクト先
    else
      render :show # 更新失敗時の再表示
    end
  end

  private

  # パラメータ制御
  def todostate_params
    params.require(:todostate).permit(todostates: %i[user_id todolist_id status])
  end

  # ログインが必要
  def require_login
    return if logged_in?

    redirect_to login_path, alert: 'Please log in to continue'
  end
end
