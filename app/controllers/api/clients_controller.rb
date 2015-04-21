class Api::ClientsController < ApplicationController
  def index
    @clients = Client.all
    render json: @clients 
  end

  def create
    @client = Client.new(client_params)

    if @client.save
      render json: 'ok', status: 200
    else
      render json: "", status: 400
    end
  end

  def update
    @client = Client.find(params[:id])

    if @client.update_attributes(client_params)
      render json: 'ok'
    else
      render json: 'error'
    end
  end

  def show
    @client = Client.find(params[:id])
    render json: @client 
  end

  def destroy
    @client = Client.find(params[:id])
    @client.destroy
    render json: 'ok', status: 200
  end

  private

    def client_params
      params.require(:client).permit(
        :user_id,
        :notes
      )
    end

end
