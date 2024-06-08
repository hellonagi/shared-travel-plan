class CommentsController < ApplicationController
  # todoのIDを取得する
  before_action :set_todo, only: [:create, :edit, :update, :destroy]

  # commentのIDを取得する
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def create
    @comment = @todo.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @todo, notice: 'コメントが正常に作成されました。'
    else
      redirect_to @todo, alert: 'コメントの作成に失敗しました。'
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to @todo, notice: 'コメントが正常に更新されました。'
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to @todo, notice: 'コメントが削除されました。'
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
end
