class Api::DependantsController < ApplicationController  
  
  before_action :load_client
  skip_before_action :load_client, only: [:all]

  def all
    @dependants = Dependant.all
    render json: @dependants
  end

  def index
    @dependants = Dependant.where(client: @client)
    render json: @dependants
  end

  def create
  end


  def show
    @dependant = Dependant.find(params[:id])
    render json: @dependant
  end

  def update
  end

  def destroy
  end

  protected

  def load_client
    @client = Client.find(params[:client_id])
  end


end
