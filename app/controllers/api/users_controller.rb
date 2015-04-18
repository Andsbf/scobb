class Api::UsersController < ApplicationController
  def index
     @users = User.all
     render json: @users
  end

  def new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: 'ok'
    else
      render json: 'error'
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end
end
