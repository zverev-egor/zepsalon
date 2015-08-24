class SessionsController < ApplicationController
  def new
  end

  def create
    @user=User.where(email: params[:email]).take
    if @user && @user.authenticate(params[:password])
      session[:user_id]=@user.id
      redirect_to root_path, notice: 'Вход выполнен'
    else
      flash[:danger]='Неверное имя пользователя или пароль'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: 'Выход выполнен'
  end
end
