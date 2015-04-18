class Api::PaymentsController < ApplicationController
  def index
    @payments = Payment.all
    render json: @payments
  end

  def new
  end

  def create
  end

  def edit
  end

  def show
    @payment = Payment.find(params[:id])
    render json: @payment
  end

  def update
  end

  def destroy
  end
end
