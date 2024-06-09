class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :edit, :update, :destroy]
  before_action :set_todo, only: [:create]
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    @comments = Comment.all
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = @todo.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to todo_path(@todo), notice: 'コメントが正常に作成されました。'
    else
      redirect_to todo_path(@todo), alert: 'コメントの作成に失敗しました。'
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to comment_path(@comment), notice: 'コメントが正常に更新されました。'
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to todo_path(@comment.todo), notice: 'コメントが削除されました。'
  end

  private

  def set_todo
    @todo = Todo.find(params[:todo_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:comment)
  end

  def logged_in_user
    unless logged_in?
      redirect_to login_url, alert: "Please log in to continue"
    end
  end
end
