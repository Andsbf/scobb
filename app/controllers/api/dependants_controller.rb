class Api::DependantsController < ApplicationController  

  #display all for parent client_id
  def index
    @dependants = Dependant.all
    render json: @dependants
  end

  def create
    @dependant = Dependant.new(dependant_params)

    if @dependant.save
      render json: @dependant, status: 200
    else
      render json: {}, status: 400
    end
  end

  def show
    @dependant = Dependant.find(params[:id])
    render json: @dependant
  end

  def update
    @dependant = Dependant.find(params[:id])

    if @dependant.update_attributes(dependant_params)
      render json: @dependant, status: 200
    else
      render json: {}, status: 400
    end
  end

  def destroy
    @dependant = Dependant.find(params[:id])
    @dependant.destroy
    render json: {}, status: 200
  end

  private

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
