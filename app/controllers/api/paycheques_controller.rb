class Api::PaychequesController < ApplicationController
  
  def index
    @paycheques = Paycheque.all
    render json: @paycheques
  end

  def create
  end

  def show
    @paycheque = Paycheque.find(params[:id])
    render json: @paycheque
  end

  def update
  end

  def destroy
  end
end
