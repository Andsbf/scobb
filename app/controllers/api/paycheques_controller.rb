class Api::PaychequesController < ApplicationController
  
  def index
    @paycheques = Paycheque.all
    render json: @paycheques
  end

  def create
    @paycheque = Paycheque.new(paycheque_params)

    if @paycheque.save
      render json: 'ok', status: 200
    else
      render json: "", status: 400
    end
  end

  def show
    @paycheque = Paycheque.find(params[:id])
    render json: @paycheque
  end

  def update
    @paycheque = Paycheque.find(params[:id])

    if @paycheque.update_attributes(paycheque_params)
      render json: 'ok'
    else
      render json: 'error'
    end 
  end

  def destroy
    @paycheque = Paycheque.find(params[:id])
    @paycheque.destroy
    render json: 'ok', status: 200
  end

  private

    def paycheque_params
      params.require(:paycheque).permit(
        :employee_id,
        :hours,
        :total,
        :is_paid,
        :payment_method,
        :payment_date
      )
    end

end
