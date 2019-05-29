# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user&.save
      flash[:success] = 'Sign up successful'
      redirect_to @user
    else
      render 'users/new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def login_page
    render 'users/login'
  end

  def login
    if User.find_by(id: params[:id])
      session[:id] = params[:id]
      redirect_to(user_path(User.find(session[:id])))
    else
      flash.now[:danger] = 'The user id you entered does not exist.'
      render 'login'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
