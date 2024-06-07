class TodostatesController < ApplicationController
  #新しいTodoStateを作成
  def new
    @todostate = Todostate.new
  end

  def create
    @todostate = Todostate.new(todostate_params)

    if @todostate.save
      redirect_to 
    else
      render 
    end  
  end   


  private
  #パラメータ制御
  def todostate_params
    params.require(:todostate).permit(:user_id, :todolist_id, :status, :comment_id)
  end

  #ログインが必要
  def require_login
    unless logged_in?
      redirect_to login_path, alert: "Please log in to continue"
    end
  end
end
