class Api::ClientsController < ApplicationController
  def index
    @clients = Client.all
    render json: @clients 
  end

  def create

    processed_client_params
    binding.pry
    @client = Client.new(processed_client_params)

    if @client.save
      render json: @client, status: 200
    else
      render json: {}, status: 400
    end
  end

  def update
    @client = Client.find(params[:id])

    if @client.update_attributes(processed_client_params)
      render json: @client, status: 200
    else
      render json: {}, status: 400
    end
  end

  def show
    @client = Client.find(params[:id])
    render json: @client 
  end

  def destroy
    @client = Client.find(params[:id])
    @client.destroy
    render json: {}, status: 200
  end

  private

    def processed_client_params
    
      address_concat = [
        client_params.a_unit,
        client_params.a_postal,
        client_params.a_number,
        client_params.a_street,
        client_params.a_city].join(',')

      client_params.merger(address: address_concat)

    end

    def client_params
      params.require(:client).permit(
      :first_name,
      :last_name,
      :email,
      :phone,
      :phone_alternate,
      :birthday,
      :gender,
      :a_unit,
      :a_postal,
      :a_number,
      :a_street,
      :a_city,
      :notes,
      :password,
      :password_confirmation
      )
    end

end
