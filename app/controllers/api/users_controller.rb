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
     @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      render json: 'ok'
    else
      render json: 'error'
    end
  end

  def edit
    @user = User.find(params[:id])
    render json: @user
  end

  def destroy
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :phone,
      :phone_alternate,
      :birthday,
      :gender,
      :address,
      :notes,
      :user_type,
      :password,
      :password_confirmation)
  end

end
