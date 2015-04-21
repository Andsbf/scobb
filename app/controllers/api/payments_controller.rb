class Api::PaymentsController < ApplicationController
  
  def index
    @payments = Payment.all
    render json: @payments
  end

  def create
  end

  def show
    @payment = Payment.find(params[:id])
    render json: @payment
  end

  def update
  end

  def destroy
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
