class Api::DependantsController < ApplicationController  
  
  before_action :load_client
  skip_before_action :load_client, only: [:all]

  def all
    @dependants = Dependant.all
    render json: @dependants
  end
  #display all for parent client_id
  def index
    @dependants = Dependant.where(client: @client)
    render json: @dependants
  end

  def create
    @dependant = Dependant.new(dependant_params)

    if @dependant.save
      render json: 'ok', status: 200
    else
      render json: "", status: 400
    end
  end

  def show
    @dependant = Dependant.find(params[:id])
    render json: @dependant
  end

  def update
    @dependant = Dependant.find(params[:id])

    if @dependant.update_attributes(dependant_params)
      render json: 'ok'
    else
      render json: 'error'
    end
  end

  def destroy
    @dependant = Dependant.find(params[:id])
    @dependant.destroy
    render json: 'ok', status: 200
  end

  private

    def load_client
      @client = Client.find(params[:client_id])
    end

    def dependant_params
      params.require(:dependant).permit(
        :client_id,
        :first_name,
        :last_name,
        :birthday,
        :gender,
        :notes
      )
    end
end
