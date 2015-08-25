class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]
  before_action :check_auth, except: [:new, :create]
  before_action :check_edit, except: [:new, :create]

  def index
    @users = User.ordering.page(params[:page])
  end


  def new
    @user = User.new
  end


  def edit
  end


  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id]=@user.id
      redirect_to root_path, notice: 'Регистрация выполнена'
    else
      render :new
    end
  end


  def update
    if @user.update(user_params)
      redirect_to users_path, notice: 'Пользователь изменен'
    else
      render :edit
    end
  end


  def destroy
    if @user.destroy
      flash[:notice]="Пользователь удален"
    else
      flash[:danger]="Удаление пользователя невозможно"
    end
    redirect_to users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    attrs=[:name, :email, :password, :password_confirmation]
    attrs << :role if User.edit?(@current_user)
    params.require(:user).permit(attrs)
  end

  def check_edit
    render_error(root_path) unless User.edit?(@current_user)
  end
end
