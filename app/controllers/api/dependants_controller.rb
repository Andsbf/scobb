class Api::DependantsController < ApplicationController
  def index
    @dependants = Dependant.all
    render json: @dependants
  end

  def new
  end

  def create
  end

  def edit
  end

  def show
    @dependant = Dependant.find(params[:id])
    render json: @dependant
  end

  def update
  end

  def destroy
  end
end
