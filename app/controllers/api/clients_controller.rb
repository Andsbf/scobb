class Api::ClientsController < ApplicationController
  def index
    @clients = Client.all
    render json: @clients 
  end

  def create
  end

  def update
  end

  def show
    @client = Client.find(params[:id])
    render json: @client 

  end

  def destroy
    @client = Client.find(params[:id])
    @client.destroy
  end

end
