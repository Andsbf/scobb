class Api::ClientsController < ApplicationController
  def index
    @clients = Client.all
   render json: @clients
  end

  def new
  end

  def create
  end

  def update
  end

  def show
  end

  def destroy
  end

  def edit
  end
end
