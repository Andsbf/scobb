class Api::PaymentsController < ApplicationController
  
  def index
    @payments = Payment.all
    render json: @payments, status: 200
  end

  def create
  end

  def show
    @payment = Payment.find(params[:id])
    render json: @payment
  end

  def update
    @payment = Payment.find(params[:id])

    if @payment.update_attributes(payment_params)
      render json: @payment, status: 200
    else
      render json: {}, status: 404
    end
  end

  def destroy
    @payment = Payment.find(params[:id])
    @payment.destroy
    render json: {}, status: 200
  end

 private

  def payment_params
    params.require(:payment).permit(
      :employee_id,
      :hours,
      :total,
      :is_paid,
      :payment_method,
      :payment_date
    )
  end
end
