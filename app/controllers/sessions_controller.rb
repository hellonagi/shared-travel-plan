class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(name: params[:session][:name])
    if user&.authenticate(params[:session][:password])
      reset_session # ログインの直前に必ずこれを書くこと
      log_in user
      redirect_to root_path
      flash.now[:success] = 'ログイン成功しました'
    else
      flash.now[:danger] = 'Invalid name/password combination'
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    log_out
    redirect_to root_url, status: :see_other
  end
end
