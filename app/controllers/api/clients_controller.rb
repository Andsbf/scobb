class Api::ClientsController < ApplicationController
  def index
    # @clients = Client.all.to_json ({:include => :dependants})
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
    @client = Client.find(params[:id])
    render json: @client #.as_json(root: true, :methods => [:dependant] ), status: 200
    # .merge(:dependants => @client.dependants.pluck(:id)) 
  end

  def destroy
  end

  def edit
  end
end
