class Api::PrivilegesController < ApplicationController
  def index
    @privileges = Privilege.all
    render json: @privileges
  end

  def new
  end

  def create
  end

  def edit
  end

  def show
    @privilege = Privilege.find(params[:id])
    render json: @privilege
  end

  def update
  end

  def destroy
  end
end
